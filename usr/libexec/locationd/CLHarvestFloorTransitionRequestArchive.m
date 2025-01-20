@interface CLHarvestFloorTransitionRequestArchive
- (CLHarvestFloorTransitionRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4 score:(float)a5 apHarvestCount:(unsigned int)a6 macsNotInALSDatabase:(id)a7;
- (NSMutableSet)macsNotInALSDatabase;
- (id)debugDescription;
- (id)description;
- (unsigned)apHarvestCount;
- (void)dealloc;
- (void)setApHarvestCount:(unsigned int)a3;
- (void)setMacsNotInALSDatabase:(id)a3;
@end

@implementation CLHarvestFloorTransitionRequestArchive

- (CLHarvestFloorTransitionRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4 score:(float)a5 apHarvestCount:(unsigned int)a6 macsNotInALSDatabase:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  v14.receiver = self;
  v14.super_class = (Class)CLHarvestFloorTransitionRequestArchive;
  v10 = [(CLHarvestScoredRequestArchive *)&v14 initWithArchive:a3 index:*(void *)&a4];
  v12 = v10;
  if (v10)
  {
    *(float *)&double v11 = a5;
    [(CLHarvestScoredRequestArchive *)v10 setScore:v11];
    [(CLHarvestFloorTransitionRequestArchive *)v12 setApHarvestCount:v8];
    [(CLHarvestFloorTransitionRequestArchive *)v12 setMacsNotInALSDatabase:a7];
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHarvestFloorTransitionRequestArchive;
  [(CLHarvestScoredRequestArchive *)&v3 dealloc];
}

- (id)description
{
  uint64_t v3 = [(CLHarvestScoredRequestArchive *)self index];
  [(CLHarvestScoredRequestArchive *)self score];
  return +[NSString stringWithFormat:@"CLHarvestFloorTransitionRequestArchive: index %u, score %.1f, apHarvestCount %d", v3, v4, self->_apHarvestCount];
}

- (id)debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v13 = self;
  macsNotInALSDatabase = self->_macsNotInALSDatabase;
  id v5 = [(NSMutableSet *)macsNotInALSDatabase countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    CFStringRef v6 = &stru_10234F018;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(macsNotInALSDatabase);
        }
        id v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) unsignedLongLongValue];
        uint64_t v15 = nullsub_41(v9, v10);
        sub_100B39278(&__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        [v3 appendFormat:@"%@%@", v6, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p)];
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        CFStringRef v6 = @", ";
      }
      id v5 = [(NSMutableSet *)macsNotInALSDatabase countByEnumeratingWithState:&v16 objects:v20 count:16];
      CFStringRef v6 = @", ";
    }
    while (v5);
  }
  return +[NSString stringWithFormat:@"%@, APs not in ALS database: [%@]", [(CLHarvestFloorTransitionRequestArchive *)v13 description], v3];
}

- (unsigned)apHarvestCount
{
  return self->_apHarvestCount;
}

- (void)setApHarvestCount:(unsigned int)a3
{
  self->_apHarvestCount = a3;
}

- (NSMutableSet)macsNotInALSDatabase
{
  return self->_macsNotInALSDatabase;
}

- (void)setMacsNotInALSDatabase:(id)a3
{
}

@end