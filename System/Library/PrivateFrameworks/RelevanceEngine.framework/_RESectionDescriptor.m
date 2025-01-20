@interface _RESectionDescriptor
- (BOOL)allowsSubsections;
- (BOOL)invertRanking;
- (NSArray)rules;
- (NSString)name;
- (_RESectionDescriptor)initWithHistoricSectionDescriptor:(id)a3;
- (_RESectionDescriptor)initWithSectionDescriptor:(id)a3;
- (int64_t)maxElementCount;
- (void)setMaxElementCount:(int64_t)a3;
- (void)setRules:(id)a3;
@end

@implementation _RESectionDescriptor

- (NSArray)rules
{
  return self->_rules;
}

- (NSString)name
{
  return self->_name;
}

- (_RESectionDescriptor)initWithSectionDescriptor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RESectionDescriptor;
  v5 = [(_RESectionDescriptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_invertRanking = 0;
    v5->_maxElementCount = [v4 maxElementCount];
    uint64_t v8 = [v4 orderedRules];
    rules = v5->_rules;
    v5->_rules = (NSArray *)v8;

    v5->_allowsSubsections = 1;
  }

  return v5;
}

- (int64_t)maxElementCount
{
  return self->_maxElementCount;
}

- (BOOL)invertRanking
{
  return self->_invertRanking;
}

- (BOOL)allowsSubsections
{
  return self->_allowsSubsections;
}

- (_RESectionDescriptor)initWithHistoricSectionDescriptor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RESectionDescriptor;
  v5 = [(_RESectionDescriptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_invertRanking = [v4 invertsRanking];
    v5->_maxElementCount = [v4 maxElementCount];
    uint64_t v8 = [v4 orderedRules];
    rules = v5->_rules;
    v5->_rules = (NSArray *)v8;

    v5->_allowsSubsections = 1;
  }

  return v5;
}

- (void)setMaxElementCount:(int64_t)a3
{
  self->_maxElementCount = a3;
}

- (void)setRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end