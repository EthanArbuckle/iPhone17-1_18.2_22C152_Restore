@interface PRSPosterUpdateComplicationPayload
+ (BOOL)supportsSecureCoding;
- (NSArray)complications;
- (NSDictionary)ambientWidgets;
- (PRSPosterUpdateComplicationPayload)initWithAmbientWidgets:(id)a3;
- (PRSPosterUpdateComplicationPayload)initWithCoder:(id)a3;
- (PRSPosterUpdateComplicationPayload)initWithComplications:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rawValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterUpdateComplicationPayload

- (PRSPosterUpdateComplicationPayload)initWithComplications:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterUpdateComplicationPayload;
  v5 = [(PRSPosterUpdatePayload *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
    complications = v5->_complications;
    v5->_complications = (NSArray *)v6;
  }
  return v5;
}

- (PRSPosterUpdateComplicationPayload)initWithAmbientWidgets:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterUpdateComplicationPayload;
  v5 = [(PRSPosterUpdatePayload *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v4 copyItems:1];
    ambientWidgets = v5->_ambientWidgets;
    v5->_ambientWidgets = (NSDictionary *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  complications = self->_complications;
  return (id)[v4 initWithComplications:complications];
}

- (PRSPosterUpdateComplicationPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterUpdatePayload *)self _init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v7 = self;
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_complications"];
    complications = v5->_complications;
    v5->_complications = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  v2 = (void *)[(NSArray *)self->_complications copy];
  return v2;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSDictionary)ambientWidgets
{
  return self->_ambientWidgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientWidgets, 0);
  objc_storeStrong((id *)&self->_complications, 0);
}

@end