@interface USOEntitySpan
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)alternatives;
- (NSMutableArray)properties;
- (NSNumber)endIndex;
- (NSNumber)sourceComponent;
- (NSNumber)startIndex;
- (NSString)label;
- (NSString)originAppId;
- (NSString)originEntityId;
- (USOEntitySpan)init;
- (USOEntitySpan)initWithCoder:(id)a3;
- (USOEntitySpan)initWithOriginAppId:(id)a3 sourceComponent:(unsigned int)a4 label:(id)a5 matchInfo:(id)a6 properties:(id)a7 startIndex:(unsigned int)a8 endIndex:(unsigned int)a9 alternatives:(id)a10 originEntityId:(id)a11;
- (USOMatchInfo)matchInfo;
- (void)addAlternative:(id)a3;
- (void)addSpanProperty:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternatives:(id)a3;
- (void)setEndIndex:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMatchInfo:(id)a3;
- (void)setOriginAppId:(id)a3;
- (void)setOriginEntityId:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSourceComponent:(id)a3;
- (void)setStartIndex:(id)a3;
@end

@implementation USOEntitySpan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originEntityId, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_endIndex, 0);
  objc_storeStrong((id *)&self->_startIndex, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_sourceComponent, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
}

- (void)setOriginEntityId:(id)a3
{
}

- (NSString)originEntityId
{
  return self->_originEntityId;
}

- (void)setAlternatives:(id)a3
{
}

- (NSMutableArray)alternatives
{
  return self->_alternatives;
}

- (void)setEndIndex:(id)a3
{
}

- (NSNumber)endIndex
{
  return self->_endIndex;
}

- (void)setStartIndex:(id)a3
{
}

- (NSNumber)startIndex
{
  return self->_startIndex;
}

- (void)setProperties:(id)a3
{
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setMatchInfo:(id)a3
{
}

- (USOMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setSourceComponent:(id)a3
{
}

- (NSNumber)sourceComponent
{
  return self->_sourceComponent;
}

- (void)setOriginAppId:(id)a3
{
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(USOEntitySpan *)self originAppId];
  [v4 encodeObject:v5 forKey:@"originAppId"];

  v6 = [(USOEntitySpan *)self sourceComponent];
  [v4 encodeObject:v6 forKey:@"sourceComponent"];

  v7 = [(USOEntitySpan *)self label];
  [v4 encodeObject:v7 forKey:@"label"];

  v8 = [(USOEntitySpan *)self matchInfo];
  [v4 encodeObject:v8 forKey:@"matchInfo"];

  v9 = [(USOEntitySpan *)self properties];
  [v4 encodeObject:v9 forKey:@"properties"];

  v10 = [(USOEntitySpan *)self startIndex];
  [v4 encodeObject:v10 forKey:@"startIndex"];

  v11 = [(USOEntitySpan *)self endIndex];
  [v4 encodeObject:v11 forKey:@"endIndex"];

  v12 = [(USOEntitySpan *)self alternatives];
  [v4 encodeObject:v12 forKey:@"alternatives"];

  id v13 = [(USOEntitySpan *)self originEntityId];
  [v4 encodeObject:v13 forKey:@"originEntityId"];
}

- (USOEntitySpan)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)USOEntitySpan;
  v5 = [(USOEntitySpan *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originAppId"];
    originAppId = v5->_originAppId;
    v5->_originAppId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceComponent"];
    sourceComponent = v5->_sourceComponent;
    v5->_sourceComponent = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchInfo"];
    matchInfo = v5->_matchInfo;
    v5->_matchInfo = (USOMatchInfo *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"properties"];
    properties = v5->_properties;
    v5->_properties = (NSMutableArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startIndex"];
    startIndex = v5->_startIndex;
    v5->_startIndex = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endIndex"];
    endIndex = v5->_endIndex;
    v5->_endIndex = (NSNumber *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"alternatives"];
    alternatives = v5->_alternatives;
    v5->_alternatives = (NSMutableArray *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originEntityId"];
    originEntityId = v5->_originEntityId;
    v5->_originEntityId = (NSString *)v28;
  }
  return v5;
}

- (void)addAlternative:(id)a3
{
}

- (void)addSpanProperty:(id)a3
{
}

- (USOEntitySpan)initWithOriginAppId:(id)a3 sourceComponent:(unsigned int)a4 label:(id)a5 matchInfo:(id)a6 properties:(id)a7 startIndex:(unsigned int)a8 endIndex:(unsigned int)a9 alternatives:(id)a10 originEntityId:(id)a11
{
  uint64_t v14 = *(void *)&a4;
  id v36 = a3;
  id v35 = a5;
  id v34 = a6;
  id v17 = a7;
  id v18 = a10;
  id v19 = a11;
  v37.receiver = self;
  v37.super_class = (Class)USOEntitySpan;
  v20 = [(USOEntitySpan *)&v37 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_originAppId, a3);
    uint64_t v22 = [NSNumber numberWithUnsignedInt:v14];
    sourceComponent = v21->_sourceComponent;
    v21->_sourceComponent = (NSNumber *)v22;

    objc_storeStrong((id *)&v21->_label, a5);
    objc_storeStrong((id *)&v21->_matchInfo, a6);
    if (v17)
    {
      uint64_t v24 = [v17 mutableCopy];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    }
    properties = v21->_properties;
    v21->_properties = (NSMutableArray *)v24;

    uint64_t v26 = [NSNumber numberWithUnsignedInt:a8];
    startIndex = v21->_startIndex;
    v21->_startIndex = (NSNumber *)v26;

    uint64_t v28 = [NSNumber numberWithUnsignedInt:a9];
    endIndex = v21->_endIndex;
    v21->_endIndex = (NSNumber *)v28;

    if (v18)
    {
      uint64_t v30 = [v18 mutableCopy];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    }
    alternatives = v21->_alternatives;
    v21->_alternatives = (NSMutableArray *)v30;

    objc_storeStrong((id *)&v21->_originEntityId, a11);
  }

  return v21;
}

- (USOEntitySpan)init
{
  v8.receiver = self;
  v8.super_class = (Class)USOEntitySpan;
  v2 = [(USOEntitySpan *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    properties = v2->_properties;
    v2->_properties = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    alternatives = v2->_alternatives;
    v2->_alternatives = (NSMutableArray *)v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end