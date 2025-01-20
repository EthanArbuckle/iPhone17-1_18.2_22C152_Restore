@interface MBDatabaseIndex
+ (id)databaseIndex;
+ (unint64_t)flagsForMode:(unsigned __int16)a3;
- (BOOL)containsDomainRedirects;
- (BOOL)containsFileID:(id)a3;
- (MBDatabaseIndex)init;
- (NSString)description;
- (double)version;
- (id)fileIDEnumerator;
- (id)setFlags:(unint64_t)a3 forFileID:(id)a4;
- (int64_t)offsetForFileID:(id)a3;
- (unint64_t)count;
- (unint64_t)flagsForFileID:(id)a3;
- (unint64_t)flagsForFileID:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)setDomainRedirects:(BOOL)a3;
- (void)setOffset:(unint64_t)a3 flags:(unint64_t)a4 forFileID:(id)a5;
@end

@implementation MBDatabaseIndex

+ (unint64_t)flagsForMode:(unsigned __int16)a3
{
  int v3 = a3 & 0xF000;
  unint64_t v4 = 1;
  uint64_t v5 = 2;
  if (v3 != 0x4000) {
    uint64_t v5 = 0;
  }
  if (v3 != 0x8000) {
    unint64_t v4 = v5;
  }
  if (v3 == 40960) {
    return 4;
  }
  else {
    return v4;
  }
}

+ (id)databaseIndex
{
  v2 = objc_alloc_init(MBDatabaseIndex);
  return v2;
}

- (MBDatabaseIndex)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBDatabaseIndex;
  v2 = [(MBDatabaseIndex *)&v4 init];
  if (v2) {
    v2->_entriesByFileID = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDatabaseIndex;
  [(MBDatabaseIndex *)&v3 dealloc];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_entriesByFileID count];
}

- (BOOL)containsFileID:(id)a3
{
  return [(NSMutableDictionary *)self->_entriesByFileID objectForKeyedSubscript:a3] != 0;
}

- (int64_t)offsetForFileID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_entriesByFileID objectForKeyedSubscript:a3];
  if (!v3) {
    return -1;
  }
  return (int64_t)[v3 offset];
}

- (unint64_t)flagsForFileID:(id)a3
{
  unint64_t result = (unint64_t)[(NSMutableDictionary *)self->_entriesByFileID objectForKeyedSubscript:a3];
  if (result)
  {
    return (unint64_t)[(id)result flags];
  }
  return result;
}

- (unint64_t)flagsForFileID:(id)a3 error:(id *)a4
{
  return -[MBDatabaseIndex flagsForFileID:](self, "flagsForFileID:", a3, a4);
}

- (id)fileIDEnumerator
{
  return [(NSMutableDictionary *)self->_entriesByFileID keyEnumerator];
}

- (id)setFlags:(unint64_t)a3 forFileID:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_entriesByFileID objectForKeyedSubscript:a4];
  objc_msgSend(v5, "setFlags:", (unint64_t)objc_msgSend(v5, "flags") | a3);
  return 0;
}

- (void)setOffset:(unint64_t)a3 flags:(unint64_t)a4 forFileID:(id)a5
{
  if ([(MBDatabaseIndex *)self offsetForFileID:a5] != -1) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBDatabaseIndex.m", 87, @"Duplicate file ID: %@", a5 object file lineNumber description];
  }
  v10 = [[MBDatabaseIndexEntry alloc] initWithOffset:a3 flags:a4];
  [(NSMutableDictionary *)self->_entriesByFileID setObject:v10 forKeyedSubscript:a5];
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  [(MBDatabaseIndex *)self version];
  return +[NSString stringWithFormat:@"<%@: version=%0.1f, count=%d>", v3, v4, [(MBDatabaseIndex *)self count]];
}

- (double)version
{
  return self->_version;
}

- (BOOL)containsDomainRedirects
{
  return self->_domainRedirects;
}

- (void)setDomainRedirects:(BOOL)a3
{
  self->_domainRedirects = a3;
}

@end