@interface PBMasterLayoutMap
+ (id)masterLayoutMap;
- (PBMasterLayoutMap)init;
- (id)allMasterIds;
- (id)masterInfoForMasterId:(int)a3;
- (id)masterInfoForSlideHolder:(id)a3;
- (id)slideLayoutForSlideHolder:(id)a3;
- (int)masterIdForTitleId:(int)a3;
- (void)setMasterId:(int)a3 forTitleId:(int)a4;
- (void)setMasterInfo:(id)a3 forMasterId:(int)a4;
@end

@implementation PBMasterLayoutMap

+ (id)masterLayoutMap
{
  v2 = objc_alloc_init(PBMasterLayoutMap);
  return v2;
}

- (PBMasterLayoutMap)init
{
  v8.receiver = self;
  v8.super_class = (Class)PBMasterLayoutMap;
  v2 = [(PBMasterLayoutMap *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mMasterIdToMasterInfoMap = v2->mMasterIdToMasterInfoMap;
    v2->mMasterIdToMasterInfoMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mTitleIdToMasterIdMap = v2->mTitleIdToMasterIdMap;
    v2->mTitleIdToMasterIdMap = v5;
  }
  return v2;
}

- (void)setMasterInfo:(id)a3 forMasterId:(int)a4
{
  id v8 = a3;
  mMasterIdToMasterInfoMap = self->mMasterIdToMasterInfoMap;
  v7 = [NSNumber numberWithLong:a4];
  [(NSMutableDictionary *)mMasterIdToMasterInfoMap setObject:v8 forKey:v7];
}

- (id)masterInfoForSlideHolder:(id)a3
{
  id v4 = a3;
  v5 = [v4 firstChildOfType:1007];
  v6 = (const void *)[v5 eshObject];
  if (!v6
  {
    id v11 = +[TCMessageException exceptionWithMessage:TCUnknownProblemMessage];
    objc_exception_throw(v11);
  }
  uint64_t v8 = v7[21];
  v9 = [(PBMasterLayoutMap *)self masterInfoForMasterId:v8];
  if (!v9)
  {
    v9 = [(PBMasterLayoutMap *)self masterInfoForMasterId:[(PBMasterLayoutMap *)self masterIdForTitleId:v8]];
  }

  return v9;
}

- (id)masterInfoForMasterId:(int)a3
{
  mMasterIdToMasterInfoMap = self->mMasterIdToMasterInfoMap;
  id v4 = [NSNumber numberWithLong:a3];
  v5 = [(NSMutableDictionary *)mMasterIdToMasterInfoMap objectForKey:v4];

  return v5;
}

- (id)allMasterIds
{
  return (id)[(NSMutableDictionary *)self->mMasterIdToMasterInfoMap allKeys];
}

- (id)slideLayoutForSlideHolder:(id)a3
{
  id v4 = a3;
  v5 = [(PBMasterLayoutMap *)self masterInfoForSlideHolder:v4];
  v6 = [v5 slideLayoutForSlideHolder:v4];

  return v6;
}

- (void)setMasterId:(int)a3 forTitleId:(int)a4
{
  mTitleIdToMasterIdMap = self->mTitleIdToMasterIdMap;
  id v7 = [NSNumber numberWithLong:a3];
  v6 = [NSNumber numberWithLong:a4];
  [(NSMutableDictionary *)mTitleIdToMasterIdMap setObject:v7 forKey:v6];
}

- (int)masterIdForTitleId:(int)a3
{
  mTitleIdToMasterIdMap = self->mTitleIdToMasterIdMap;
  id v4 = [NSNumber numberWithLong:a3];
  v5 = [(NSMutableDictionary *)mTitleIdToMasterIdMap objectForKey:v4];
  int v6 = [v5 intValue];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTitleIdToMasterIdMap, 0);
  objc_storeStrong((id *)&self->mMasterIdToMasterInfoMap, 0);
}

@end