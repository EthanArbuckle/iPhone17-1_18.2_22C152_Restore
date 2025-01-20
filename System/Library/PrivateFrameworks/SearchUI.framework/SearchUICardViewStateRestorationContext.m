@interface SearchUICardViewStateRestorationContext
+ (BOOL)supportsSecureCoding;
- (SFCard)card;
- (SearchUICardViewStateRestorationContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)level;
- (void)encodeWithCoder:(id)a3;
- (void)setCard:(id)a3;
- (void)setLevel:(unint64_t)a3;
@end

@implementation SearchUICardViewStateRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SearchUICardViewStateRestorationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUICardViewStateRestorationContext;
  v5 = [(SearchUICollectionViewRestorationContext *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"card"];
    card = v5->_card;
    v5->_card = (SFCard *)v6;

    v5->_level = (int)[v4 decodeInt64ForKey:@"level"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICardViewStateRestorationContext;
  id v4 = a3;
  [(SearchUICollectionViewRestorationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_card, @"card", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_level forKey:@"level"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUICardViewStateRestorationContext;
  id v4 = [(SearchUICollectionViewRestorationContext *)&v7 copyWithZone:a3];
  objc_super v5 = [(SearchUICardViewStateRestorationContext *)self card];
  [v4 setCard:v5];

  objc_msgSend(v4, "setLevel:", -[SearchUICardViewStateRestorationContext level](self, "level"));
  return v4;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (SFCard)card
{
  return (SFCard *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCard:(id)a3
{
}

- (void).cxx_destruct
{
}

@end