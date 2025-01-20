@interface _SRUIFDataStoreEntry
- (_SRUIFDataStoreEntry)initWithPropertyListRepresentation:(id)a3 error:(id *)p_isa;
- (_SRUIFDataStoreEntry)initWithType:(int64_t)a3 value:(id)a4;
- (id)_propertyListStringForType;
- (id)_valueForPropertyListRepresentation:(id)a3 type:(int64_t)a4;
- (id)_valuePropertyListRepresentation;
- (id)propertyListRepresentation;
- (id)value;
- (int64_t)_typeForPropertyListString:(id)a3;
- (int64_t)type;
@end

@implementation _SRUIFDataStoreEntry

- (_SRUIFDataStoreEntry)initWithType:(int64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SRUIFDataStoreEntry;
  v8 = [(_SRUIFDataStoreEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

- (id)_propertyListStringForType
{
  if ([(_SRUIFDataStoreEntry *)self type]) {
    return @"Image";
  }
  else {
    return @"Unknown";
  }
}

- (int64_t)_typeForPropertyListString:(id)a3
{
  return [a3 isEqualToString:@"Image"];
}

- (id)_valuePropertyListRepresentation
{
  id value = self->_value;
  if (self->_type == 1)
  {
    v3 = (void *)MEMORY[0x263EFF9A0];
    id v4 = value;
    id v5 = [v3 dictionary];
    v6 = [v4 imageData];
    [v5 setObject:v6 forKey:@"PNGData"];

    id v7 = NSNumber;
    [v4 scale];
    double v9 = v8;

    v10 = [v7 numberWithDouble:v9];
    [v5 setObject:v10 forKey:@"Scale"];
  }
  else
  {
    id v5 = value;
  }
  return v5;
}

- (id)_valueForPropertyListRepresentation:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = objc_alloc_init(SRUIFImagePNGData);
    double v8 = [v6 objectForKey:@"PNGData"];
    [(SRUIFImagePNGData *)v7 setImageData:v8];

    double v9 = [v6 objectForKey:@"Scale"];

    [v9 doubleValue];
    -[SRUIFImagePNGData setScale:](v7, "setScale:");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)propertyListRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:&unk_26D9B5F80 forKey:@"Version"];
  id v4 = [(_SRUIFDataStoreEntry *)self _propertyListStringForType];
  [v3 setObject:v4 forKey:@"Type"];

  id v5 = [(_SRUIFDataStoreEntry *)self _valuePropertyListRepresentation];
  [v3 setObject:v5 forKey:@"Value"];

  return v3;
}

- (_SRUIFDataStoreEntry)initWithPropertyListRepresentation:(id)a3 error:(id *)p_isa
{
  id v6 = a3;
  id v7 = objc_alloc_init(SRUIFDictionarySchema);
  double v8 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v7 setObjectCoercion:v8 forKey:@"Version"];

  double v9 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v7 setObjectCoercion:v9 forKey:@"Type"];

  v10 = [(SRUIFDictionarySchema *)v7 coerceObject:v6 error:p_isa];
  objc_super v11 = [v10 objectForKey:@"Version"];
  uint64_t v12 = [v11 integerValue];

  if (v12 == 1)
  {
    v13 = [v10 objectForKey:@"Type"];
    int64_t v14 = [(_SRUIFDataStoreEntry *)self _typeForPropertyListString:v13];

    v15 = [v10 objectForKey:@"Value"];
    v16 = [(_SRUIFDataStoreEntry *)self _valueForPropertyListRepresentation:v15 type:v14];

    if (v16)
    {
      self = [(_SRUIFDataStoreEntry *)self initWithType:v14 value:v16];
      p_isa = (id *)&self->super.isa;
    }
    else if (p_isa)
    {
      v17 = [NSString stringWithFormat:@"Unable to decode value for data store entry %@", v6];
      *p_isa = +[SRUIFConversationError errorWithCode:300 localizedFailureReason:v17];

      p_isa = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[_SRUIFDataStoreEntry initWithPropertyListRepresentation:error:]();
    }
    p_isa = 0;
  }

  return (_SRUIFDataStoreEntry *)p_isa;
}

- (int64_t)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

- (void)initWithPropertyListRepresentation:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_225FBA000, v0, OS_LOG_TYPE_ERROR, "%s unable to deserialize property list with version %{public}ld; returning nil",
    (uint8_t *)v1,
    0x16u);
}

@end