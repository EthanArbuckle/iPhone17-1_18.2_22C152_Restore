@interface PPParsedCSSI
- (NSArray)identifiers;
- (NSMutableSet)neStrings;
- (NSMutableSet)topicStrings;
- (PPParsedCSSI)init;
- (void)setIdentifiers:(id)a3;
- (void)setNeStrings:(id)a3;
- (void)setTopicStrings:(id)a3;
@end

@implementation PPParsedCSSI

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicStrings, 0);
  objc_storeStrong((id *)&self->_neStrings, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (void)setTopicStrings:(id)a3
{
}

- (NSMutableSet)topicStrings
{
  return self->_topicStrings;
}

- (void)setNeStrings:(id)a3
{
}

- (NSMutableSet)neStrings
{
  return self->_neStrings;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (PPParsedCSSI)init
{
  v10.receiver = self;
  v10.super_class = (Class)PPParsedCSSI;
  v2 = [(PPParsedCSSI *)&v10 init];
  v3 = v2;
  if (v2)
  {
    identifiers = v2->_identifiers;
    v2->_identifiers = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v5 = objc_opt_new();
    neStrings = v3->_neStrings;
    v3->_neStrings = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    topicStrings = v3->_topicStrings;
    v3->_topicStrings = (NSMutableSet *)v7;
  }
  return v3;
}

@end