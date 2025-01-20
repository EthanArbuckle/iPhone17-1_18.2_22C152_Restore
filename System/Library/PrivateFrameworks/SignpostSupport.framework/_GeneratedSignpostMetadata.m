@interface _GeneratedSignpostMetadata
- (NSNumber)baseMct;
- (NSNumber)beginMct;
- (NSNumber)emitMct;
- (NSNumber)endMct;
- (NSNumber)signpostId;
- (NSString)name;
- (_GeneratedSignpostMetadata)initWithName:(id)a3;
- (void)setBaseMct:(id)a3;
- (void)setBeginMct:(id)a3;
- (void)setEmitMct:(id)a3;
- (void)setEndMct:(id)a3;
- (void)setSignpostId:(id)a3;
@end

@implementation _GeneratedSignpostMetadata

- (_GeneratedSignpostMetadata)initWithName:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)_GeneratedSignpostMetadata;
    v6 = [(_GeneratedSignpostMetadata *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_name, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = _signpost_debug_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_GeneratedSignpostMetadata initWithName:]();
    }

    v8 = 0;
  }

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(id)a3
{
}

- (NSNumber)beginMct
{
  return self->_beginMct;
}

- (void)setBeginMct:(id)a3
{
}

- (NSNumber)endMct
{
  return self->_endMct;
}

- (void)setEndMct:(id)a3
{
}

- (NSNumber)emitMct
{
  return self->_emitMct;
}

- (void)setEmitMct:(id)a3
{
}

- (NSNumber)baseMct
{
  return self->_baseMct;
}

- (void)setBaseMct:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseMct, 0);
  objc_storeStrong((id *)&self->_emitMct, 0);
  objc_storeStrong((id *)&self->_endMct, 0);
  objc_storeStrong((id *)&self->_beginMct, 0);
  objc_storeStrong((id *)&self->_signpostId, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "nil name when trying to initialize _GeneratedSignpostMetadata", v2, v3, v4, v5, v6);
}

@end