@interface RMModelStatusDynamic
+ (id)buildWithStatusItemType:(id)a3;
- (BOOL)isArrayValue;
- (RMModelStatusDynamic)initWithSchema:(id)a3;
- (RMModelStatusSchema)schema;
- (id)copyWithZone:(_NSZone *)a3;
- (id)statusItemType;
- (void)setSchema:(id)a3;
@end

@implementation RMModelStatusDynamic

+ (id)buildWithStatusItemType:(id)a3
{
  id v3 = a3;
  v4 = +[RMModelStatusSchema schemas];
  v5 = [v4 objectForKeyedSubscript:v3];

  if (v5) {
    v6 = [[RMModelStatusDynamic alloc] initWithSchema:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (RMModelStatusDynamic)initWithSchema:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMModelStatusDynamic;
  v6 = [(RMModelStatusDynamic *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_schema, a3);
  }

  return v7;
}

- (id)statusItemType
{
  v2 = [(RMModelStatusDynamic *)self schema];
  id v3 = [v2 statusType];

  return v3;
}

- (BOOL)isArrayValue
{
  v2 = [(RMModelStatusDynamic *)self schema];
  char v3 = [v2 isArrayValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RMModelStatusDynamic;
  v4 = [(RMModelPayloadBase *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_schema);
  return v4;
}

- (RMModelStatusSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (void).cxx_destruct
{
}

@end