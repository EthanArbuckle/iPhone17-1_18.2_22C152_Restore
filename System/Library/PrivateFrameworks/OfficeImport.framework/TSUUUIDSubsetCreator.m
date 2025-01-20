@interface TSUUUIDSubsetCreator
- (TSUUUIDSetStore)uuidSetStore;
- (TSUUUIDSubsetCreator)initWithUuidSetStore:(id)a3 baseUuidVector:(const void *)a4;
- (const)baseUuidVector;
- (id).cxx_construct;
- (unsigned)uuidSetStoreIndexForIndexesInRange:(_NSRange)a3;
@end

@implementation TSUUUIDSubsetCreator

- (TSUUUIDSubsetCreator)initWithUuidSetStore:(id)a3 baseUuidVector:(const void *)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TSUUUIDSubsetCreator;
  v8 = [(TSUUUIDSubsetCreator *)&v14 init];
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuidSetStore, a3);
    if (&v9->_baseUuidVector != a4) {
      std::vector<TSU::UUIDData<TSP::UUIDData>>::__assign_with_size[abi:ne180100]<TSU::UUIDData<TSP::UUIDData>*,TSU::UUIDData<TSP::UUIDData>*>((char *)&v9->_baseUuidVector, *(char **)a4, *((void *)a4 + 1), (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4);
    }
    uint64_t v11 = objc_opt_new();
    createdSubsetsByRange = v10->_createdSubsetsByRange;
    v10->_createdSubsetsByRange = (NSMutableDictionary *)v11;
  }
  return v10;
}

- (unsigned)uuidSetStoreIndexForIndexesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  if (a3.length)
  {
    NSUInteger location = a3.location;
    v6 = NSStringFromRange(a3);
    id v7 = [(NSMutableDictionary *)self->_createdSubsetsByRange objectForKey:v6];
    v8 = v7;
    if (v7)
    {
      LODWORD(length) = [v7 unsignedIntegerValue];
    }
    else
    {
      unint64_t v9 = length + location - 1;
      if (v9 >= ((char *)self->_baseUuidVector.__end_ - (char *)self->_baseUuidVector.__begin_) >> 4)
      {
        v10 = [NSString stringWithUTF8String:"-[TSUUUIDSubsetCreator uuidSetStoreIndexForIndexesInRange:]"];
        uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDSetStore.mm"];
        +[OITSUAssertionHandler handleFailureInFunction:v10, v11, 322, 0, "Range %@ too large for uuid vector", v6 file lineNumber isFatal description];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      v12 = objc_opt_new();
      if (location <= v9)
      {
        uint64_t v13 = 16 * location;
        do
        {
          begin = (char *)self->_baseUuidVector.__begin_;
          if (location >= ((char *)self->_baseUuidVector.__end_ - (char *)begin) >> 4) {
            std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
          }
          long long v16 = *(_OWORD *)&begin[v13];
          [v12 addUUID:&v16];
          ++location;
          v13 += 16;
          --length;
        }
        while (length);
      }
      LODWORD(length) = [(TSUUUIDSetStore *)self->_uuidSetStore addSet:v12];
      v8 = [NSNumber numberWithUnsignedInteger:length];
      if (v8) {
        [(NSMutableDictionary *)self->_createdSubsetsByRange setObject:v8 forKey:v6];
      }
    }
  }
  return length;
}

- (const)baseUuidVector
{
  return &self->_baseUuidVector;
}

- (TSUUUIDSetStore)uuidSetStore
{
  return (TSUUUIDSetStore *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdSubsetsByRange, 0);
  begin = self->_baseUuidVector.__begin_;
  if (begin)
  {
    self->_baseUuidVector.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_uuidSetStore, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end