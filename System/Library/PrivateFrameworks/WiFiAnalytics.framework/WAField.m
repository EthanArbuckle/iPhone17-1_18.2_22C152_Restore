@interface WAField
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLValue;
- (BOOL)isNumerical;
- (BOOL)isRepeatable;
- (NSData)bytesValue;
- (NSMutableArray)repeatableValues;
- (NSString)key;
- (NSString)stringValue;
- (WAField)init;
- (WAField)initWithCoder:(id)a3;
- (WAField)initWithType:(int64_t)a3 isRepeatable:(BOOL)a4 andKey:(id)a5 andTypeInfoForRepeatableSubmessage:(id)a6;
- (WAField)initWithType:(int64_t)a3 isRepeatable:(BOOL)a4 key:(id)a5 repeatableValues:(id)a6 doubleValue:(double)a7 floatValue:(float)a8 int32Value:(int)a9 int64Value:(int64_t)a10 uint32Val:(unsigned int)a11 uint64Value:(unint64_t)a12 BOOLValue:(BOOL)a13 stringValue:(id)a14 bytesValue:(id)a15 subMessageValue:(id)a16 andTypeInfoForRepeatableSubmessage:(id)a17;
- (WAMessageAWD)subMessageValue;
- (double)doubleValue;
- (float)floatValue;
- (id)_ownTypeAsString;
- (id)_typeAsString:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeInformationForRepeatableSubmessage;
- (int)int32Value;
- (int64_t)int64Value;
- (int64_t)type;
- (unint64_t)uint64Value;
- (unsigned)uint32Value;
- (void)_addRepeatableValue:(id)a3;
- (void)_throwIncorrecTypeExceptionForType:(int64_t)a3 isGet:(BOOL)a4;
- (void)_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:(BOOL)a3 isGet:(BOOL)a4 forType:(int64_t)a5;
- (void)addRepeatableBoolValue:(BOOL)a3;
- (void)addRepeatableBytes:(id)a3;
- (void)addRepeatableDoubleValue:(double)a3;
- (void)addRepeatableFloatValue:(float)a3;
- (void)addRepeatableInt32Value:(int)a3;
- (void)addRepeatableInt64Value:(int64_t)a3;
- (void)addRepeatableString:(id)a3;
- (void)addRepeatableSubMessageValue:(id)a3;
- (void)addRepeatableUInt32Value:(unsigned int)a3;
- (void)addRepeatableUInt64Value:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setBytesValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setFloatValue:(float)a3;
- (void)setInt32Value:(int)a3;
- (void)setInt64Value:(int64_t)a3;
- (void)setIsRepeatable:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setRepeatableValues:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setSubMessageValue:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeInformationForRepeatableSubmessage:(id)a3;
- (void)setUint32Value:(unsigned int)a3;
- (void)setUint64Value:(unint64_t)a3;
@end

@implementation WAField

- (NSString)key
{
  return self->_key;
}

- (WAMessageAWD)subMessageValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 10)
  {
    if (![(WAField *)self isRepeatable])
    {
      id v3 = self->_value;
      goto LABEL_4;
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      v14 = "-[WAField subMessageValue]";
      __int16 v15 = 1024;
      *(_DWORD *)v16 = 193;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single submessage value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:10];
  }
  else
  {
    v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      v14 = "-[WAField subMessageValue]";
      __int16 v15 = 1024;
      *(_DWORD *)v16 = 192;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get submessage value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:10 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    *(void *)v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  id v3 = 0;
LABEL_4:
  return (WAMessageAWD *)v3;
}

- (void)setInt32Value:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 3)
  {
    if (![(WAField *)self isRepeatable])
    {
      self->_value = [NSNumber numberWithInt:v3];
      MEMORY[0x270F9A758]();
      return;
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self key];
      int v13 = 136446978;
      v14 = "-[WAField setInt32Value:]";
      __int16 v15 = 1024;
      *(_DWORD *)v16 = 222;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v3;
      *(_WORD *)&v16[10] = 2112;
      *(void *)&v16[12] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%d) on a repeatable field (%@). Ignored.", (uint8_t *)&v13, 0x22u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:3];
  }
  else
  {
    v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      v14 = "-[WAField setInt32Value:]";
      __int16 v15 = 1024;
      *(_DWORD *)v16 = 221;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      *(_WORD *)&unsigned char v16[14] = 2112;
      *(void *)&v16[16] = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set an int32 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:3 isGet:0];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    *(void *)v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)setStringValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(WAField *)self type] == 8)
  {
    if (![(WAField *)self isRepeatable])
    {
      objc_storeStrong(&self->_value, a3);
      goto LABEL_4;
    }
    v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [(WAField *)self key];
      int v14 = 136446978;
      __int16 v15 = "-[WAField setStringValue:]";
      __int16 v16 = 1024;
      *(_DWORD *)uint64_t v17 = 271;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%@) on a repeatable field (%@). Ignored.", (uint8_t *)&v14, 0x26u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:8];
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [(WAField *)self _ownTypeAsString];
      v8 = [(WAField *)self key];
      int v14 = 136446978;
      __int16 v15 = "-[WAField setStringValue:]";
      __int16 v16 = 1024;
      *(_DWORD *)uint64_t v17 = 270;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set string value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v14, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:8 isGet:0];
  }
  v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v12 = [(WAField *)self key];
    int v13 = [(WAField *)self _ownTypeAsString];
    int v14 = 138412546;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    *(void *)uint64_t v17 = v13;
    _os_log_fault_impl(&dword_21D96D000, v11, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v14, 0x16u);
  }
LABEL_4:
}

- (void)setUint32Value:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 5)
  {
    if (![(WAField *)self isRepeatable])
    {
      self->_value = [NSNumber numberWithUnsignedInt:v3];
      MEMORY[0x270F9A758]();
      return;
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setUint32Value:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 241;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v3;
      *(_WORD *)&v16[10] = 2112;
      *(void *)&v16[12] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%u) on a repeatable field (%@). Ignored.", (uint8_t *)&v13, 0x22u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:5];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setUint32Value:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 240;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      *(_WORD *)&unsigned char v16[14] = 2112;
      *(void *)&v16[16] = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set uint32 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:5 isGet:0];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
}

- (unsigned)uint32Value
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 5)
  {
    if (![(WAField *)self isRepeatable])
    {
      id value = self->_value;
      return [value unsignedIntValue];
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField uint32Value]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 148;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single uint32 value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:5];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField uint32Value]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 147;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get uint32 value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:5 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  return 0;
}

- (int)int32Value
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 3)
  {
    if (![(WAField *)self isRepeatable])
    {
      id value = self->_value;
      return [value intValue];
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField int32Value]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 130;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single int32 value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:5];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField int32Value]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 129;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get int32 value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:3 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  return 0;
}

- (void)setUint64Value:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 6)
  {
    if (![(WAField *)self isRepeatable])
    {
      self->_id value = [NSNumber numberWithUnsignedLongLong:a3];
      MEMORY[0x270F9A758]();
      return;
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setUint64Value:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 251;
      *(_WORD *)&v16[4] = 2048;
      *(void *)&v16[6] = a3;
      __int16 v17 = 2112;
      __int16 v18 = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%llu) on a repeatable field (%@). Ignored.", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:6];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setUint64Value:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 250;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set uint64 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:6 isGet:0];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
}

- (unint64_t)uint64Value
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 6)
  {
    if (![(WAField *)self isRepeatable])
    {
      id value = self->_value;
      return [value unsignedLongLongValue];
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField uint64Value]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 157;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single uint64 value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:6];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField uint64Value]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 156;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get uint64 value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:6 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  return 0;
}

- (NSMutableArray)repeatableValues
{
  if ([(WAField *)self isRepeatable]) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }
  return (NSMutableArray *)v3;
}

- (NSString)stringValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 8)
  {
    if (![(WAField *)self isRepeatable])
    {
      id v3 = self->_value;
      goto LABEL_4;
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField stringValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 175;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single string value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:8];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField stringValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 174;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get string value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:8 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  id v3 = 0;
LABEL_4:
  return (NSString *)v3;
}

- (BOOL)isRepeatable
{
  return self->_isRepeatable;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)int64Value
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 4)
  {
    if (![(WAField *)self isRepeatable])
    {
      id value = self->_value;
      return [value longLongValue];
    }
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField int64Value]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 139;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single int64 value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:4];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField int64Value]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 138;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get int64 value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:4 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  return 0;
}

- (WAField)initWithType:(int64_t)a3 isRepeatable:(BOOL)a4 andKey:(id)a5 andTypeInfoForRepeatableSubmessage:(id)a6
{
  LOBYTE(v8) = 0;
  LODWORD(v7) = 0;
  return [(WAField *)self initWithType:a3 isRepeatable:a4 key:a5 repeatableValues:0 doubleValue:0 floatValue:0 int32Value:0.0 int64Value:0.0 uint32Val:v7 uint64Value:0 BOOLValue:v8 stringValue:0 bytesValue:0 subMessageValue:0 andTypeInfoForRepeatableSubmessage:a6];
}

- (WAField)initWithType:(int64_t)a3 isRepeatable:(BOOL)a4 key:(id)a5 repeatableValues:(id)a6 doubleValue:(double)a7 floatValue:(float)a8 int32Value:(int)a9 int64Value:(int64_t)a10 uint32Val:(unsigned int)a11 uint64Value:(unint64_t)a12 BOOLValue:(BOOL)a13 stringValue:(id)a14 bytesValue:(id)a15 subMessageValue:(id)a16 andTypeInfoForRepeatableSubmessage:(id)a17
{
  uint64_t v17 = *(void *)&a9;
  BOOL v19 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v24 = a5;
  id v44 = a6;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  v45.receiver = self;
  v45.super_class = (Class)WAField;
  v29 = [(WAField *)&v45 init];
  v30 = v29;
  if (!v29)
  {
    p_super = 0;
LABEL_21:
    v36 = v44;
    goto LABEL_22;
  }
  if (!a3 || !v24)
  {
    v42 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v47 = "-[WAField initWithType:isRepeatable:key:repeatableValues:doubleValue:floatValue:int32Value:int64Value:uint32"
            "Val:uint64Value:BOOLValue:stringValue:bytesValue:subMessageValue:andTypeInfoForRepeatableSubmessage:]";
      __int16 v48 = 1024;
      int v49 = 40;
      _os_log_impl(&dword_21D96D000, v42, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: didn't get required arguments", buf, 0x12u);
    }

    p_super = &v30->super;
    v30 = 0;
    goto LABEL_21;
  }
  v29->_type = a3;
  v29->_isRepeatable = v19;
  uint64_t v31 = [v24 mutableCopy];
  key = v30->_key;
  v30->_key = (NSString *)v31;

  uint64_t v33 = [v28 mutableCopy];
  typeInfoForRepeatableSubmessage = v30->_typeInfoForRepeatableSubmessage;
  v30->_typeInfoForRepeatableSubmessage = (NSString *)v33;

  if (!v19)
  {
    switch(a3)
    {
      case 1:
        uint64_t v39 = [NSNumber numberWithDouble:a7];
        goto LABEL_20;
      case 2:
        *(float *)&double v35 = a8;
        uint64_t v39 = [NSNumber numberWithFloat:v35];
        goto LABEL_20;
      case 3:
        uint64_t v39 = [NSNumber numberWithInt:v17];
        goto LABEL_20;
      case 4:
        uint64_t v39 = [NSNumber numberWithLongLong:a10];
        goto LABEL_20;
      case 5:
        uint64_t v39 = [NSNumber numberWithUnsignedInt:a11];
        goto LABEL_20;
      case 6:
        uint64_t v39 = [NSNumber numberWithUnsignedLongLong:a12];
        goto LABEL_20;
      case 7:
        uint64_t v39 = [NSNumber numberWithBool:a13];
        goto LABEL_20;
      case 8:
        v40 = v25;
        goto LABEL_18;
      case 9:
        v40 = v26;
LABEL_18:
        uint64_t v39 = objc_msgSend(v40, "mutableCopy", a10);
        goto LABEL_20;
      case 10:
        uint64_t v39 = [v27 copy];
LABEL_20:
        p_super = v30->_value;
        v30->_id value = (id)v39;
        break;
      default:
        p_super = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v47 = "-[WAField initWithType:isRepeatable:key:repeatableValues:doubleValue:floatValue:int32Value:int64Value:ui"
                "nt32Val:uint64Value:BOOLValue:stringValue:bytesValue:subMessageValue:andTypeInfoForRepeatableSubmessage:]";
          __int16 v48 = 1024;
          int v49 = 83;
          _os_log_impl(&dword_21D96D000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[WAField init] Unhandled field type", buf, 0x12u);
        }
        break;
    }
    goto LABEL_21;
  }
  v36 = v44;
  id v37 = v44;
  p_super = v30->_value;
  v30->_id value = v37;
LABEL_22:

  return v30;
}

- (void)setKey:(id)a3
{
}

- (double)doubleValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 1)
  {
    if (![(WAField *)self isRepeatable])
    {
      id value = self->_value;
      [value doubleValue];
      return result;
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField doubleValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 112;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single double value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:1];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField doubleValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 111;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get double value from field of wrong type (this field is a %@). Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:1 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  return 0.0;
}

- (float)floatValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 2)
  {
    if (![(WAField *)self isRepeatable])
    {
      id value = self->_value;
      [value floatValue];
      return result;
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField floatValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 121;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single float value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:2];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField floatValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 120;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get float value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:2 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  return 0.0;
}

- (BOOL)BOOLValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 7)
  {
    if (![(WAField *)self isRepeatable])
    {
      id value = self->_value;
      return [value BOOLValue];
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField BOOLValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 166;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single BOOL value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:7];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField BOOLValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 165;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get BOOL value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:7 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  return 0;
}

- (NSData)bytesValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 9)
  {
    if (![(WAField *)self isRepeatable])
    {
      id v3 = self->_value;
      goto LABEL_4;
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self _ownTypeAsString];
      int v13 = 136446722;
      int v14 = "-[WAField bytesValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 184;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single bytes value from a repeatable field (this field is a %@)", (uint8_t *)&v13, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:1 forType:9];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField bytesValue]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 183;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get bytes value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:9 isGet:1];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
  id v3 = 0;
LABEL_4:
  return (NSData *)v3;
}

- (void)setDoubleValue:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 1)
  {
    if (![(WAField *)self isRepeatable])
    {
      self->_id value = [NSNumber numberWithDouble:a3];
      MEMORY[0x270F9A758]();
      return;
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setDoubleValue:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 202;
      *(_WORD *)&v16[4] = 2048;
      *(double *)&v16[6] = a3;
      __int16 v17 = 2112;
      __int16 v18 = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%f) on a repeatable field (%@). Ignored.", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:1];
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setDoubleValue:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 201;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set double value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:1 isGet:0];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)setFloatValue:(float)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 2)
  {
    if (![(WAField *)self isRepeatable])
    {
      *(float *)&double v5 = a3;
      self->_id value = [NSNumber numberWithFloat:v5];
      MEMORY[0x270F9A758]();
      return;
    }
    v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [(WAField *)self key];
      int v14 = 136446978;
      __int16 v15 = "-[WAField setFloatValue:]";
      __int16 v16 = 1024;
      *(_DWORD *)__int16 v17 = 212;
      *(_WORD *)&v17[4] = 2048;
      *(double *)&v17[6] = a3;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%f) on a repeatable field (%@). Ignored.", (uint8_t *)&v14, 0x26u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:2];
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [(WAField *)self _ownTypeAsString];
      uint64_t v8 = [(WAField *)self key];
      int v14 = 136446978;
      __int16 v15 = "-[WAField setFloatValue:]";
      __int16 v16 = 1024;
      *(_DWORD *)__int16 v17 = 211;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set float value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v14, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:2 isGet:0];
  }
  v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v12 = [(WAField *)self key];
    int v13 = [(WAField *)self _ownTypeAsString];
    int v14 = 138412546;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    *(void *)__int16 v17 = v13;
    _os_log_fault_impl(&dword_21D96D000, v11, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)setInt64Value:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 4)
  {
    if (![(WAField *)self isRepeatable])
    {
      self->_id value = [NSNumber numberWithLongLong:a3];
      MEMORY[0x270F9A758]();
      return;
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setInt64Value:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 232;
      *(_WORD *)&v16[4] = 2048;
      *(void *)&v16[6] = a3;
      __int16 v17 = 2112;
      __int16 v18 = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%lld) on a repeatable field (%@). Ignored.", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:4];
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setInt64Value:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 231;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set an int64 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:4 isGet:0];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)setBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 7)
  {
    if (![(WAField *)self isRepeatable])
    {
      self->_id value = [NSNumber numberWithBool:v3];
      MEMORY[0x270F9A758]();
      return;
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setBoolValue:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 261;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v3;
      *(_WORD *)&v16[10] = 2112;
      *(void *)&v16[12] = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%d) on a repeatable field (%@). Ignored.", (uint8_t *)&v13, 0x22u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:7];
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v13 = 136446978;
      int v14 = "-[WAField setBoolValue:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 260;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v6;
      *(_WORD *)&unsigned char v16[14] = 2112;
      *(void *)&v16[16] = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set BOOL value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v13, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:7 isGet:0];
  }
  v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = [(WAField *)self key];
    v12 = [(WAField *)self _ownTypeAsString];
    int v13 = 138412546;
    int v14 = v11;
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v12;
    _os_log_fault_impl(&dword_21D96D000, v10, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)setBytesValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(WAField *)self type] == 9)
  {
    if (![(WAField *)self isRepeatable])
    {
      objc_storeStrong(&self->_value, a3);
      goto LABEL_4;
    }
    v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [(WAField *)self key];
      int v14 = 136446978;
      __int16 v15 = "-[WAField setBytesValue:]";
      __int16 v16 = 1024;
      *(_DWORD *)uint64_t v17 = 281;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%@) on a repeatable field (%@). Ignored.", (uint8_t *)&v14, 0x26u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:9];
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [(WAField *)self _ownTypeAsString];
      uint64_t v8 = [(WAField *)self key];
      int v14 = 136446978;
      __int16 v15 = "-[WAField setBytesValue:]";
      __int16 v16 = 1024;
      *(_DWORD *)uint64_t v17 = 280;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set bytes value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v14, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:9 isGet:0];
  }
  v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v12 = [(WAField *)self key];
    int v13 = [(WAField *)self _ownTypeAsString];
    int v14 = 138412546;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    *(void *)uint64_t v17 = v13;
    _os_log_fault_impl(&dword_21D96D000, v11, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v14, 0x16u);
  }
LABEL_4:
}

- (void)setSubMessageValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(WAField *)self type] == 10)
  {
    if (![(WAField *)self isRepeatable])
    {
      objc_storeStrong(&self->_value, a3);
      goto LABEL_4;
    }
    v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [(WAField *)self key];
      int v14 = 136446978;
      __int16 v15 = "-[WAField setSubMessageValue:]";
      __int16 v16 = 1024;
      *(_DWORD *)uint64_t v17 = 291;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%@) on a repeatable field (%@). Ignored.", (uint8_t *)&v14, 0x26u);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:0 isGet:0 forType:10];
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [(WAField *)self _ownTypeAsString];
      uint64_t v8 = [(WAField *)self key];
      int v14 = 136446978;
      __int16 v15 = "-[WAField setSubMessageValue:]";
      __int16 v16 = 1024;
      *(_DWORD *)uint64_t v17 = 290;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set submessage value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v14, 0x26u);
    }
    [(WAField *)self _throwIncorrecTypeExceptionForType:10 isGet:0];
  }
  v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v12 = [(WAField *)self key];
    int v13 = [(WAField *)self _ownTypeAsString];
    int v14 = 138412546;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    *(void *)uint64_t v17 = v13;
    _os_log_fault_impl(&dword_21D96D000, v11, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v14, 0x16u);
  }
LABEL_4:
}

- (void)setRepeatableValues:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(WAField *)self isRepeatable])
  {
    objc_storeStrong(&self->_value, a3);
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446466;
      v11 = "-[WAField setRepeatableValues:]";
      __int16 v12 = 1024;
      LODWORD(v13) = 300;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set to set repeatable values on a field that's not repeatable. Ignored", (uint8_t *)&v10, 0x12u);
    }

    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:1 isGet:0 forType:0];
    uint64_t v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = [(WAField *)self key];
      v9 = [(WAField *)self _ownTypeAsString];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_fault_impl(&dword_21D96D000, v7, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)addRepeatableDoubleValue:(double)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 1)
  {
    id v11 = [NSNumber numberWithDouble:a3];
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");
  }
  else
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      *(_DWORD *)buf = 136446978;
      int v13 = "-[WAField addRepeatableDoubleValue:]";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 309;
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable double value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = [(WAField *)self key];
      int v10 = [(WAField *)self _ownTypeAsString];
      *(_DWORD *)buf = 138412546;
      int v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v10;
      _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);
    }
  }
}

- (void)addRepeatableFloatValue:(float)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 2)
  {
    *(float *)&double v5 = a3;
    id v12 = [NSNumber numberWithFloat:v5];
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [(WAField *)self _ownTypeAsString];
      uint64_t v8 = [(WAField *)self key];
      *(_DWORD *)buf = 136446978;
      __int16 v14 = "-[WAField addRepeatableFloatValue:]";
      __int16 v15 = 1024;
      *(_DWORD *)__int16 v16 = 318;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable float value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);
    }
    v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = [(WAField *)self key];
      id v11 = [(WAField *)self _ownTypeAsString];
      *(_DWORD *)buf = 138412546;
      __int16 v14 = v10;
      __int16 v15 = 2112;
      *(void *)__int16 v16 = v11;
      _os_log_fault_impl(&dword_21D96D000, v9, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);
    }
  }
}

- (void)addRepeatableInt32Value:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 3)
  {
    id v11 = [NSNumber numberWithInt:v3];
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      *(_DWORD *)buf = 136446978;
      int v13 = "-[WAField addRepeatableInt32Value:]";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 327;
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = v6;
      __int16 v16 = 2112;
      __int16 v17 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable int32 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = [(WAField *)self key];
      int v10 = [(WAField *)self _ownTypeAsString];
      *(_DWORD *)buf = 138412546;
      int v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v10;
      _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);
    }
  }
}

- (void)addRepeatableInt64Value:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 4)
  {
    id v11 = [NSNumber numberWithLongLong:a3];
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      *(_DWORD *)buf = 136446978;
      int v13 = "-[WAField addRepeatableInt64Value:]";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 336;
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = v6;
      __int16 v16 = 2112;
      __int16 v17 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable int64 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = [(WAField *)self key];
      int v10 = [(WAField *)self _ownTypeAsString];
      *(_DWORD *)buf = 138412546;
      int v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v10;
      _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);
    }
  }
}

- (void)addRepeatableUInt32Value:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 5)
  {
    id v11 = [NSNumber numberWithUnsignedInt:v3];
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      *(_DWORD *)buf = 136446978;
      int v13 = "-[WAField addRepeatableUInt32Value:]";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 345;
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = v6;
      __int16 v16 = 2112;
      __int16 v17 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable uint32 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = [(WAField *)self key];
      int v10 = [(WAField *)self _ownTypeAsString];
      *(_DWORD *)buf = 138412546;
      int v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v10;
      _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);
    }
  }
}

- (void)addRepeatableUInt64Value:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 6)
  {
    id v11 = [NSNumber numberWithUnsignedLongLong:a3];
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      *(_DWORD *)buf = 136446978;
      int v13 = "-[WAField addRepeatableUInt64Value:]";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 354;
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = v6;
      __int16 v16 = 2112;
      __int16 v17 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable uint64 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = [(WAField *)self key];
      int v10 = [(WAField *)self _ownTypeAsString];
      *(_DWORD *)buf = 138412546;
      int v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v10;
      _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);
    }
  }
}

- (void)addRepeatableBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type] == 7)
  {
    id v11 = [NSNumber numberWithBool:v3];
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      *(_DWORD *)buf = 136446978;
      int v13 = "-[WAField addRepeatableBoolValue:]";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 363;
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = v6;
      __int16 v16 = 2112;
      __int16 v17 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable BOOL value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = [(WAField *)self key];
      int v10 = [(WAField *)self _ownTypeAsString];
      *(_DWORD *)buf = 138412546;
      int v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v10;
      _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);
    }
  }
}

- (void)addRepeatableString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if ([(WAField *)self type] == 8)
    {
      [(WAField *)self _addRepeatableValue:v4];
      goto LABEL_4;
    }
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v11 = 136446978;
      id v12 = "-[WAField addRepeatableString:]";
      __int16 v13 = 1024;
      *(_DWORD *)__int16 v14 = 373;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v6;
      __int16 v15 = 2112;
      __int16 v16 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable string value on a WAField instance that's not of that type (type is %@). Set was ignored . Field key: %@", (uint8_t *)&v11, 0x26u);

      goto LABEL_9;
    }
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self key];
      int v11 = 136446722;
      id v12 = "-[WAField addRepeatableString:]";
      __int16 v13 = 1024;
      *(_DWORD *)__int16 v14 = 372;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v6;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add nil string value - preventing crash by bailing but DATA LOSS HAS LIKELY OCCURRED as the caller meant to add something. Field key: %@", (uint8_t *)&v11, 0x1Cu);
LABEL_9:
    }
  }

  uint64_t v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    v9 = [(WAField *)self key];
    int v10 = [(WAField *)self _ownTypeAsString];
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    *(void *)__int16 v14 = v10;
    _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", (uint8_t *)&v11, 0x16u);
  }
LABEL_4:
}

- (void)addRepeatableBytes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if ([(WAField *)self type] == 9)
    {
      [(WAField *)self _addRepeatableValue:v4];
      goto LABEL_4;
    }
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v11 = 136446978;
      id v12 = "-[WAField addRepeatableBytes:]";
      __int16 v13 = 1024;
      *(_DWORD *)__int16 v14 = 383;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v6;
      __int16 v15 = 2112;
      __int16 v16 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable bytes value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v11, 0x26u);

      goto LABEL_9;
    }
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self key];
      int v11 = 136446722;
      id v12 = "-[WAField addRepeatableBytes:]";
      __int16 v13 = 1024;
      *(_DWORD *)__int16 v14 = 382;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v6;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add nil bytes value - preventing crash by bailing but DATA LOSS HAS LIKELY OCCURRED as the caller meant to add something. Field key: %@", (uint8_t *)&v11, 0x1Cu);
LABEL_9:
    }
  }

  uint64_t v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    v9 = [(WAField *)self key];
    int v10 = [(WAField *)self _ownTypeAsString];
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    *(void *)__int16 v14 = v10;
    _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", (uint8_t *)&v11, 0x16u);
  }
LABEL_4:
}

- (void)addRepeatableSubMessageValue:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if ([(WAField *)self type] == 10)
    {
      [(WAField *)self _addRepeatableValue:v4];
      goto LABEL_4;
    }
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self _ownTypeAsString];
      uint64_t v7 = [(WAField *)self key];
      int v11 = 136446978;
      id v12 = "-[WAField addRepeatableSubMessageValue:]";
      __int16 v13 = 1024;
      *(_DWORD *)__int16 v14 = 393;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v6;
      __int16 v15 = 2112;
      __int16 v16 = v7;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable submessage value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v11, 0x26u);

      goto LABEL_9;
    }
  }
  else
  {
    double v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(WAField *)self key];
      int v11 = 136446722;
      id v12 = "-[WAField addRepeatableSubMessageValue:]";
      __int16 v13 = 1024;
      *(_DWORD *)__int16 v14 = 392;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v6;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add nil submessage value - preventing crash by bailing but DATA LOSS HAS LIKELY OCCURRED as the caller meant to add something. Field key: %@", (uint8_t *)&v11, 0x1Cu);
LABEL_9:
    }
  }

  uint64_t v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    v9 = [(WAField *)self key];
    int v10 = [(WAField *)self _ownTypeAsString];
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    *(void *)__int16 v14 = v10;
    _os_log_fault_impl(&dword_21D96D000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", (uint8_t *)&v11, 0x16u);
  }
LABEL_4:
}

- (void)_addRepeatableValue:(id)a3
{
  *(void *)&v15[13] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WAField *)self isRepeatable])
  {
    if (!self->_value || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      id value = self->_value;
      self->_id value = v5;
    }
    [self->_value addObject:v4];
  }
  else
  {
    uint64_t v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(WAField *)self key];
      int v12 = 136446722;
      __int16 v13 = "-[WAField _addRepeatableValue:]";
      __int16 v14 = 1024;
      *(_DWORD *)__int16 v15 = 402;
      v15[2] = 2112;
      *(void *)&v15[3] = v8;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable values to a field that's not repeatable. This action was ignored. Key: %@", (uint8_t *)&v12, 0x1Cu);
    }
    [(WAField *)self _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:1 isGet:0 forType:0];
    v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = [(WAField *)self key];
      int v11 = [(WAField *)self _ownTypeAsString];
      int v12 = 138412546;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v11;
      _os_log_fault_impl(&dword_21D96D000, v9, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (WAField)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Please use the init defined in the header for this class" userInfo:0];
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v20 = (void *)MEMORY[0x263F08928];
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  __int16 v13 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  id v22 = 0;
  __int16 v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v22];
  id v15 = v22;
  id v21 = v15;
  __int16 v16 = [v20 unarchivedObjectOfClasses:v13 fromData:v14 error:&v21];
  id v17 = v21;

  if (v17)
  {
    uint64_t v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v24 = "-[WAField copyWithZone:]";
      __int16 v25 = 1024;
      int v26 = 420;
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAMessageAWD copyWithZone failed, unarchive/archive error: %@", buf, 0x1Cu);
    }
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_type forKey:@"_type"];
  [v6 encodeBool:self->_isRepeatable forKey:@"_isRepeatable"];
  [v6 encodeObject:self->_key forKey:@"_key"];
  typeInfoForRepeatableSubmessage = self->_typeInfoForRepeatableSubmessage;
  if (typeInfoForRepeatableSubmessage) {
    [v6 encodeObject:typeInfoForRepeatableSubmessage forKey:@"_typeInfoForRepeatableSubmessage"];
  }
  id value = self->_value;
  if (value) {
    [v6 encodeObject:value forKey:@"_value"];
  }
}

- (WAField)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WAField;
  uint64_t v5 = [(WAField *)&v24 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_isRepeatable = [v4 decodeBoolForKey:@"_isRepeatable"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_key"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_typeInfoForRepeatableSubmessage"];
    typeInfoForRepeatableSubmessage = v5->_typeInfoForRepeatableSubmessage;
    v5->_typeInfoForRepeatableSubmessage = (NSString *)v8;

    if (v5->_isRepeatable)
    {
      v23 = (void *)MEMORY[0x263EFFA08];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_msgSend(v23, "setWithObjects:", v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
      uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"_value"];
      id value = v5->_value;
      v5->_id value = (id)v19;
    }
    else
    {
      switch([(WAField *)v5 type])
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
          uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_value"];
          uint64_t v18 = v5->_value;
          v5->_id value = (id)v21;
          break;
        default:
          uint64_t v18 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            int v26 = "-[WAField initWithCoder:]";
            __int16 v27 = 1024;
            int v28 = 472;
            _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: unexpected type", buf, 0x12u);
          }
          break;
      }
    }
  }
  return v5;
}

- (id)description
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  if ([(WAField *)self type])
  {
    BOOL v3 = [MEMORY[0x263F089D8] string];
    id v4 = [(WAField *)self key];
    uint64_t v5 = [(WAField *)self _ownTypeAsString];
    [v3 appendFormat:@"%@ - %@: ", v4, v5];

    if ([(WAField *)self isRepeatable])
    {
      uint64_t v6 = [(WAField *)self repeatableValues];
      uint64_t v7 = [v6 count];

      if (v7) {
        uint64_t v8 = @"[\r";
      }
      else {
        uint64_t v8 = @"[]";
      }
      [v3 appendString:v8];
    }
    unint64_t v9 = 0;
    while (1)
    {
      if ([(WAField *)self isRepeatable])
      {
        uint64_t v10 = [(WAField *)self repeatableValues];
        int v11 = [v10 count];

        int v12 = v11 >= 10 ? 10 : v11;
        unint64_t v13 = v12;
      }
      else
      {
        unint64_t v13 = 1;
      }
      BOOL v14 = [(WAField *)self isRepeatable];
      if (v9 >= v13) {
        break;
      }
      if (v14) {
        [v3 appendString:@"          "];
      }
      switch([(WAField *)self type])
      {
        case 1:
          uint64_t v15 = NSString;
          BOOL v16 = [(WAField *)self isRepeatable];
          uint64_t v17 = self;
          if (v16)
          {
            v85 = [(WAField *)self repeatableValues];
            uint64_t v17 = [v85 objectAtIndexedSubscript:v9];
            v79 = v17;
          }
          [v17 doubleValue];
          uint64_t v19 = objc_msgSend(v15, "stringWithFormat:", @"%f", v18);
          [v3 appendString:v19];

          if (v16)
          {

            uint64_t v20 = v85;
            goto LABEL_70;
          }
          goto LABEL_71;
        case 2:
          id v22 = NSString;
          BOOL v23 = [(WAField *)self isRepeatable];
          objc_super v24 = self;
          if (v23)
          {
            v84 = [(WAField *)self repeatableValues];
            objc_super v24 = [v84 objectAtIndexedSubscript:v9];
            v76 = v24;
          }
          [v24 floatValue];
          int v26 = objc_msgSend(v22, "stringWithFormat:", @"%f", v25);
          [v3 appendString:v26];

          if (v23)
          {

            uint64_t v20 = v84;
            goto LABEL_70;
          }
          goto LABEL_71;
        case 3:
          __int16 v27 = NSString;
          BOOL v28 = [(WAField *)self isRepeatable];
          if (v28)
          {
            v83 = [(WAField *)self repeatableValues];
            v78 = [v83 objectAtIndexedSubscript:v9];
            uint64_t v29 = [v78 intValue];
          }
          else
          {
            uint64_t v29 = [(WAField *)self int32Value];
          }
          v52 = objc_msgSend(v27, "stringWithFormat:", @"%d", v29);
          [v3 appendString:v52];

          if (v28)
          {

            uint64_t v20 = v83;
            goto LABEL_70;
          }
          goto LABEL_71;
        case 4:
          v30 = NSString;
          BOOL v31 = [(WAField *)self isRepeatable];
          if (v31)
          {
            v82 = [(WAField *)self repeatableValues];
            v75 = [v82 objectAtIndexedSubscript:v9];
            int64_t v32 = (int)[v75 intValue];
          }
          else
          {
            int64_t v32 = [(WAField *)self int64Value];
          }
          v53 = objc_msgSend(v30, "stringWithFormat:", @"%lld", v32);
          [v3 appendString:v53];

          if (v31)
          {

            uint64_t v20 = v82;
            goto LABEL_70;
          }
          goto LABEL_71;
        case 5:
          uint64_t v33 = NSString;
          BOOL v34 = [(WAField *)self isRepeatable];
          if (v34)
          {
            v81 = [(WAField *)self repeatableValues];
            v73 = [v81 objectAtIndexedSubscript:v9];
            uint64_t v35 = [v73 unsignedIntValue];
          }
          else
          {
            uint64_t v35 = [(WAField *)self uint32Value];
          }
          v54 = objc_msgSend(v33, "stringWithFormat:", @"%u", v35);
          [v3 appendString:v54];

          if (v34)
          {

            uint64_t v20 = v81;
            goto LABEL_70;
          }
          goto LABEL_71;
        case 6:
          v36 = NSString;
          BOOL v37 = [(WAField *)self isRepeatable];
          if (v37)
          {
            v80 = [(WAField *)self repeatableValues];
            v71 = [v80 objectAtIndexedSubscript:v9];
            uint64_t v38 = [v71 unsignedLongLongValue];
          }
          else
          {
            uint64_t v38 = [(WAField *)self uint64Value];
          }
          v55 = objc_msgSend(v36, "stringWithFormat:", @"%llu", v38);
          [v3 appendString:v55];

          if (v37)
          {

            uint64_t v20 = v80;
            goto LABEL_70;
          }
          goto LABEL_71;
        case 7:
          uint64_t v39 = NSString;
          BOOL v40 = [(WAField *)self isRepeatable];
          v41 = self;
          if (v40)
          {
            v77 = [(WAField *)self repeatableValues];
            v41 = [v77 objectAtIndexedSubscript:v9];
            v68 = v41;
          }
          v42 = objc_msgSend(v39, "stringWithFormat:", @"%d", objc_msgSend(v41, "BOOLValue"));
          [v3 appendString:v42];

          if (v40)
          {

            uint64_t v20 = v77;
            goto LABEL_70;
          }
          goto LABEL_71;
        case 8:
          v43 = NSString;
          BOOL v44 = [(WAField *)self isRepeatable];
          if (v44)
          {
            v74 = [(WAField *)self repeatableValues];
            uint64_t v45 = [v74 objectAtIndexedSubscript:v9];
            v66 = (void *)v45;
          }
          else
          {
            uint64_t v45 = [(WAField *)self stringValue];
            v69 = v45;
          }
          v56 = [v43 stringWithFormat:@"%@", v45];
          [v3 appendString:v56];

          if (v44)
          {

            uint64_t v20 = v74;
          }
          else
          {
            uint64_t v20 = v69;
          }
          goto LABEL_70;
        case 9:
          v46 = NSString;
          BOOL v47 = [(WAField *)self isRepeatable];
          if (v47)
          {
            v72 = [(WAField *)self repeatableValues];
            uint64_t v48 = [v72 objectAtIndexedSubscript:v9];
            v64 = (void *)v48;
          }
          else
          {
            uint64_t v48 = [(WAField *)self bytesValue];
            v67 = v48;
          }
          v57 = [v46 stringWithFormat:@"%@", v48];
          [v3 appendString:v57];

          if (v47)
          {

            uint64_t v20 = v72;
          }
          else
          {
            uint64_t v20 = v67;
          }
          goto LABEL_70;
        case 10:
          int v49 = NSString;
          BOOL v50 = [(WAField *)self isRepeatable];
          if (v50)
          {
            v70 = [(WAField *)self repeatableValues];
            uint64_t v51 = [v70 objectAtIndexedSubscript:v9];
            v63 = (void *)v51;
          }
          else
          {
            uint64_t v51 = [(WAField *)self subMessageValue];
            v65 = v51;
          }
          v58 = [v49 stringWithFormat:@"%@", v51];
          [v3 appendString:v58];

          if (v50)
          {

            uint64_t v20 = v70;
          }
          else
          {
            uint64_t v20 = v65;
          }
          goto LABEL_70;
        default:
          uint64_t v20 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            int64_t v21 = [(WAField *)self type];
            *(_DWORD *)buf = 136446722;
            v87 = "-[WAField description]";
            __int16 v88 = 1024;
            int v89 = 542;
            __int16 v90 = 2048;
            int64_t v91 = v21;
            _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Unhandled type: %ld", buf, 0x1Cu);
          }
LABEL_70:

LABEL_71:
          if ([(WAField *)self isRepeatable]) {
            [v3 appendString:@",\r"];
          }
          if (v9 == 9) {
            [v3 appendString:@"          ...\r"];
          }
          ++v9;
          break;
      }
    }
    if (v14)
    {
      v59 = [(WAField *)self repeatableValues];
      uint64_t v60 = [v59 count];

      if (v60) {
        [v3 appendString:@"     ]"];
      }
    }
    v61 = [NSString stringWithString:v3];
  }
  else
  {
    v61 = @"No type, likely not initialized";
  }
  return v61;
}

- (id)_typeAsString:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  switch(a3)
  {
    case 0:
      uint64_t v6 = @"[NO TYPE INFO]";
      goto LABEL_15;
    case 1:
      uint64_t v6 = @"double";
      goto LABEL_15;
    case 2:
      uint64_t v6 = @"float";
      goto LABEL_15;
    case 3:
      uint64_t v6 = @"int32";
      goto LABEL_15;
    case 4:
      uint64_t v6 = @"int64";
      goto LABEL_15;
    case 5:
      uint64_t v6 = @"uint32";
      goto LABEL_15;
    case 6:
      uint64_t v6 = @"uint64";
      goto LABEL_15;
    case 7:
      uint64_t v6 = @"BOOL";
      goto LABEL_15;
    case 8:
      uint64_t v6 = @"string";
      goto LABEL_15;
    case 9:
      uint64_t v6 = @"bytes";
      goto LABEL_15;
    case 10:
      if ([(WAField *)self isRepeatable])
      {
        unint64_t v9 = [(NSString *)self->_typeInfoForRepeatableSubmessage componentsSeparatedByString:@"^^"];
      }
      else
      {
        unint64_t v9 = 0;
      }
      if ([(WAField *)self isRepeatable])
      {
        uint64_t v10 = [(WAField *)self repeatableValues];
        int v11 = [v10 firstObject];
        int v12 = NSString;
        if (v11)
        {
          unint64_t v13 = [(WAField *)self repeatableValues];
          BOOL v14 = [v13 firstObject];
          uint64_t v15 = [v14 key];
          BOOL v16 = [(WAField *)self repeatableValues];
          [v12 stringWithFormat:@"Repeatable submessage with key: %@, count: %lu", v15, objc_msgSend(v16, "count"), v18];
        }
        else
        {
          unint64_t v13 = [v9 objectAtIndexedSubscript:0];
          BOOL v14 = [v9 objectAtIndexedSubscript:1];
          uint64_t v15 = [(WAField *)self repeatableValues];
          BOOL v16 = [v15 firstObject];
          [v12 stringWithFormat:@"Repeatable submessage, key: %@ original classname: %@ first instance: %@", v13, v14, v16];
        uint64_t v17 = };
        [v5 appendFormat:@"%@", v17];
      }
      else
      {
        uint64_t v10 = [(WAField *)self subMessageValue];
        int v11 = [v10 key];
        [v5 appendFormat:@"%@", v11];
      }

      goto LABEL_16;
    default:
      uint64_t v7 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v20 = "-[WAField _typeAsString:]";
        __int16 v21 = 1024;
        int v22 = 600;
        __int16 v23 = 2048;
        int64_t v24 = [(WAField *)self type];
        _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Unhandled type: %ld", buf, 0x1Cu);
      }

      uint64_t v6 = @"[UNDETERMINED TYPE]";
LABEL_15:
      [v5 appendString:v6];
LABEL_16:
      return v5;
  }
}

- (id)_ownTypeAsString
{
  int64_t v3 = [(WAField *)self type];
  return [(WAField *)self _typeAsString:v3];
}

- (void)_throwIncorrecTypeExceptionForType:(int64_t)a3 isGet:(BOOL)a4
{
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  if (a4) {
    uint64_t v8 = @"GET";
  }
  else {
    uint64_t v8 = @"SET";
  }
  unint64_t v9 = [(WAField *)self _typeAsString:a3];
  uint64_t v10 = [(WAField *)self _ownTypeAsString];
  int v11 = [(WAField *)self key];
  int v12 = [v7 stringWithFormat:@"Attempt to %@ %@ value on a field that's a %@. Field Key: %@", v8, v9, v10, v11];
  id v13 = [v5 exceptionWithName:v6 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:(BOOL)a3 isGet:(BOOL)a4 forType:(int64_t)a5
{
  BOOL v5 = a3;
  uint64_t v7 = (void *)MEMORY[0x263EFF940];
  uint64_t v8 = *MEMORY[0x263EFF498];
  unint64_t v9 = NSString;
  if (a4) {
    uint64_t v10 = @"GET";
  }
  else {
    uint64_t v10 = @"SET";
  }
  int v11 = [(WAField *)self _typeAsString:a5];
  uint64_t v12 = [(WAField *)self key];
  id v13 = (void *)v12;
  if (v5) {
    [v9 stringWithFormat:@"Attempt to %@ a single value on a field that holds repeatable values. Type: %@ field key: %@", v10, v11, v12];
  }
  else {
  BOOL v14 = [v9 stringWithFormat:@"Attempt to %@ a repeatable value on a field that should contain a single value. Type: %@ field key: %@", v10, v11, v12];
  }
  id v15 = [v7 exceptionWithName:v8 reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (BOOL)isNumerical
{
  return (unint64_t)([(WAField *)self type] - 1) < 7;
}

- (void)setTypeInformationForRepeatableSubmessage:(id)a3
{
}

- (id)typeInformationForRepeatableSubmessage
{
  return self->_typeInfoForRepeatableSubmessage;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setIsRepeatable:(BOOL)a3
{
  self->_isRepeatable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_typeInfoForRepeatableSubmessage, 0);
  objc_storeStrong(&self->_value, 0);
}

@end