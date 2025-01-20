@interface PCNativePrimitiveColor
- (id)initWithString:(id)a3;
@end

@implementation PCNativePrimitiveColor

- (id)initWithString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 length] == (id)6 || objc_msgSend(v5, "length") == (id)8))
  {
    id v6 = v5;
    uint64_t v7 = strtol((const char *)[v6 cStringUsingEncoding:4], 0, 16);
    if ([v6 length] == (id)6) {
      uint64_t v8 = (v7 << 8) | 0xFF;
    }
    else {
      uint64_t v8 = v7;
    }
  }
  else
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Invalid color string: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v8 = 0;
  }
  v10 = [(PCNativePrimitiveColor *)self initWithRGBA:v8];

  return v10;
}

@end