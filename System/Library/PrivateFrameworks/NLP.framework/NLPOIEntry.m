@interface NLPOIEntry
- (NLPOIEntry)initWithProtoBuf:(id)a3;
- (NSString)name;
- (float)score;
- (unsigned)category;
- (void)dealloc;
@end

@implementation NLPOIEntry

- (NLPOIEntry)initWithProtoBuf:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NLPOIEntry;
  v4 = [(NLPOIEntry *)&v6 init];
  if (v4) {
    v4->m_impl = (NLPOIEntryImpl *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NLPOIEntry;
  [(NLPOIEntry *)&v3 dealloc];
}

- (NSString)name
{
  return [(NLPOIEntryImpl *)self->m_impl name];
}

- (unsigned)category
{
  if ([(NSString *)[(NLPOIEntryImpl *)self->m_impl category] isEqualToString:@"active"])
  {
    return 1;
  }
  if ([(NSString *)[(NLPOIEntryImpl *)self->m_impl category] isEqualToString:@"arts"])
  {
    return 2;
  }
  if ([(NSString *)[(NLPOIEntryImpl *)self->m_impl category] isEqualToString:@"education"])
  {
    return 3;
  }
  return 0;
}

- (float)score
{
  [(NLPOIEntryImpl *)self->m_impl score];
  return result;
}

@end