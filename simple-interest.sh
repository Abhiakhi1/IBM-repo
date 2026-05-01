#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on principal, rate, and time period
# Formula: Simple Interest = (Principal × Rate × Time) / 100

echo "======================================"
echo "   Simple Interest Calculator"
echo "======================================"
echo ""

# Get input from user
read -p "Enter Principal Amount (P): " principal
read -p "Enter Rate of Interest (R) in %: " rate
read -p "Enter Time Period (T) in years: " time

# Validate input
if ! [[ "$principal" =~ ^[0-9]+\.?[0-9]*$ ]] || ! [[ "$rate" =~ ^[0-9]+\.?[0-9]*$ ]] || ! [[ "$time" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: Please enter valid positive numbers"
    exit 1
fi

# Calculate simple interest
# Simple Interest = (P × R × T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate total amount
# Total Amount = Principal + Simple Interest
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "======================================"
echo "   Calculation Results"
echo "======================================"
echo "Principal Amount:     \$$principal"
echo "Rate of Interest:     $rate%"
echo "Time Period:          $time years"
echo "------------------------------------"
echo "Simple Interest:      \$$simple_interest"
echo "Total Amount:         \$$total_amount"
echo "======================================"
echo ""
