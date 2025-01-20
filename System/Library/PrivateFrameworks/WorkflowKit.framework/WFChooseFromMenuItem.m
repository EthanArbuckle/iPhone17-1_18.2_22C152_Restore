@interface WFChooseFromMenuItem
+ (BOOL)supportsSecureCoding;
- (NSArray)synonyms;
- (NSString)string;
- (NSString)subtitle;
- (WFChooseFromMenuItem)initWithCoder:(id)a3;
- (WFChooseFromMenuItem)initWithString:(id)a3 synonyms:(id)a4 subtitle:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFChooseFromMenuItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (NSString)string
{
  return self->_string;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFChooseFromMenuItem *)self string];
  [v4 encodeObject:v5 forKey:@"string"];

  v6 = [(WFChooseFromMenuItem *)self synonyms];
  [v4 encodeObject:v6 forKey:@"synonyms"];

  id v7 = [(WFChooseFromMenuItem *)self subtitle];
  [v4 encodeObject:v7 forKey:@"subtitle"];
}

- (WFChooseFromMenuItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"synonyms"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];

  v11 = &stru_1F229A4D8;
  if (v10) {
    v11 = v10;
  }
  v12 = v11;

  v13 = [(WFChooseFromMenuItem *)self initWithString:v5 synonyms:v9 subtitle:v12];
  return v13;
}

- (WFChooseFromMenuItem)initWithString:(id)a3 synonyms:(id)a4 subtitle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFChooseFromMenuItem;
  v11 = [(WFChooseFromMenuItem *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    string = v11->_string;
    v11->_string = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    synonyms = v11->_synonyms;
    v11->_synonyms = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    subtitle = v11->_subtitle;
    v11->_subtitle = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end