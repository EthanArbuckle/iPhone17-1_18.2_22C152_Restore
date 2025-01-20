@interface WBSContentBlockerStatisticsFirstParty
- (BOOL)isEqual:(id)a3;
- (NSString)domain;
- (WBSContentBlockerStatisticsFirstParty)initWithDomain:(id)a3 lastSeen:(double)a4;
- (double)lastSeen;
- (unint64_t)hash;
@end

@implementation WBSContentBlockerStatisticsFirstParty

- (WBSContentBlockerStatisticsFirstParty)initWithDomain:(id)a3 lastSeen:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSContentBlockerStatisticsFirstParty;
  v8 = [(WBSContentBlockerStatisticsFirstParty *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_domain, a3);
    v9->_lastSeen = a4;
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSContentBlockerStatisticsFirstParty *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(NSString *)v5->_domain isEqualToString:self->_domain]) {
        BOOL v6 = v5->_lastSeen == self->_lastSeen;
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_domain hash] ^ (unint64_t)self->_lastSeen;
}

- (NSString)domain
{
  return self->_domain;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (void).cxx_destruct
{
}

@end