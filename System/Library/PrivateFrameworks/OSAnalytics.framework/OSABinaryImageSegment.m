@interface OSABinaryImageSegment
- (OSABinaryImageSegment)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 for:(unsigned __int8)a5[16];
- (OSABinaryImageSegment)initWithSymbol:(id)a3;
- (OSASymbolInfo)symbolInfo;
- (id)details;
- (id)full_details;
- (int)source;
- (unint64_t)used_index;
- (void)setSource:(int)a3;
- (void)setUsed_index:(unint64_t)a3;
@end

@implementation OSABinaryImageSegment

- (OSABinaryImageSegment)initWithSymbol:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OSABinaryImageSegment;
  v6 = [(OSABinaryImageSegment *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_symbolInfo, a3);
    v7->_source = 0;
    v7->_used_index = 0;
  }

  return v7;
}

- (OSABinaryImageSegment)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 for:(unsigned __int8)a5[16]
{
  v6 = [[OSASymbolInfo alloc] initWithAddress:a3 size:a4 for:a5];
  v7 = [(OSABinaryImageSegment *)self initWithSymbol:v6];

  return v7;
}

- (id)details
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = [(OSASymbolInfo *)self->_symbolInfo get_uuid];
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSASymbolInfo start](self->_symbolInfo, "start"));
  v8[1] = v4;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%c", self->_source);
  v8[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

- (id)full_details
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v13[0] = @"uuid";
  v4 = [(OSASymbolInfo *)self->_symbolInfo get_uuid];
  v14[0] = v4;
  v13[1] = @"base";
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSASymbolInfo start](self->_symbolInfo, "start"));
  v14[1] = v5;
  v13[2] = @"source";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%c", self->_source);
  v14[2] = v6;
  v13[3] = @"size";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSASymbolInfo size](self->_symbolInfo, "size"));
  v14[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  objc_super v9 = (void *)[v3 initWithDictionary:v8];

  v10 = [(OSASymbolInfo *)self->_symbolInfo name];
  [v9 setObject:v10 forKeyedSubscript:@"name"];

  [v9 setObject:self->_symbolInfo->legacy_arch forKeyedSubscript:@"arch"];
  v11 = [(OSASymbolInfo *)self->_symbolInfo path];
  [v9 setObject:v11 forKeyedSubscript:@"path"];

  return v9;
}

- (OSASymbolInfo)symbolInfo
{
  return self->_symbolInfo;
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (unint64_t)used_index
{
  return self->_used_index;
}

- (void)setUsed_index:(unint64_t)a3
{
  self->_used_index = a3;
}

- (void).cxx_destruct
{
}

@end