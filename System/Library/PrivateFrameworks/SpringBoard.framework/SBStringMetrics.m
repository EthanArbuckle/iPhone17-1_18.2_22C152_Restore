@interface SBStringMetrics
- (SBStringMetrics)init;
- (id)description;
- (id)fragments;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)fragmentCount;
- (void)addFragment:(id)a3;
@end

@implementation SBStringMetrics

- (SBStringMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBStringMetrics;
  v2 = [(SBStringMetrics *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fragments = v2->_fragments;
    v2->_fragments = v3;
  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; %lu fragment(s)> %@",
               objc_opt_class(),
               self,
               [(SBStringMetrics *)self fragmentCount],
               self->_fragments);
}

- (void)addFragment:(id)a3
{
}

- (id)fragments
{
  v2 = (void *)[(NSMutableArray *)self->_fragments copy];
  return v2;
}

- (unint64_t)fragmentCount
{
  return [(NSMutableArray *)self->_fragments count];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_fragments countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
}

@end