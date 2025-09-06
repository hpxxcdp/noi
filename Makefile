CXX = g++
CXXFLAGS = -Wall -O2
SRC_DIR = src
BUILD_DIR = build
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))
TARGET = main

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
    @mkdir -p $(BUILD_DIR)
    $(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
    $(CXX) $(CXXFLAGS) $^ -o $@

.PHONY: clean
clean:
    rm -rf $(BUILD_DIR) $(TARGET)