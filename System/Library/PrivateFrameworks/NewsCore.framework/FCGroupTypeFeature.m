@interface FCGroupTypeFeature
- (FCGroupTypeFeature)initWithGroupType:(int64_t)a3;
- (FCGroupTypeFeature)initWithPersonalizationIdentifier:(id)a3;
- (int64_t)groupType;
- (void)setGroupType:(int64_t)a3;
@end

@implementation FCGroupTypeFeature

- (FCGroupTypeFeature)initWithGroupType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FCGroupTypeFeature;
  v4 = [(FCPersonalizationFeature *)&v11 init];
  v5 = v4;
  if (v4)
  {
    [(FCGroupTypeFeature *)v4 setGroupType:a3];
    v6 = NSString;
    v7 = NSStringFromFCFeedGroupType(a3);
    uint64_t v8 = [v6 stringWithFormat:@"%@%@%@", @"f6", @"+", v7];
    personalizationIdentifier = v5->super._personalizationIdentifier;
    v5->super._personalizationIdentifier = (NSString *)v8;
  }
  return v5;
}

- (FCGroupTypeFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rangeOfString:@"+"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend(v4, "substringWithRange:", v5 + v6, objc_msgSend(v4, "length") - (v5 + v6));
    self = [(FCGroupTypeFeature *)self initWithGroupType:FCFeedGroupTypeFromNSString(v8)];

    v7 = self;
  }

  return v7;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

@end