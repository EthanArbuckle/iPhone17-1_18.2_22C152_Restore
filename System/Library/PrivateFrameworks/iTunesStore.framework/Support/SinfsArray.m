@interface SinfsArray
- (BOOL)_isRecognizedProperty:(id)a3;
- (NSArray)sinfs;
- (SinfsArray)init;
- (SinfsArray)initWithSINFs:(id)a3;
- (id)_copyValueForSINF:(id)a3 property:(id)a4 error:(id *)a5;
- (id)copyValueForField:(int64_t)a3 error:(id *)a4;
- (id)copyValueForProperty:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation SinfsArray

- (SinfsArray)init
{
  return [(SinfsArray *)self initWithSINFs:0];
}

- (SinfsArray)initWithSINFs:(id)a3
{
  if (![a3 count]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"FairPlayUtility.m" lineNumber:497 description:@"Must have at least one sinf"];
  }
  v8.receiver = self;
  v8.super_class = (Class)SinfsArray;
  v6 = [(SinfsArray *)&v8 init];
  if (v6) {
    v6->_sinfs = (NSArray *)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SinfsArray;
  [(SinfsArray *)&v3 dealloc];
}

- (id)copyValueForField:(int64_t)a3 error:(id *)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  sinfs = self->_sinfs;
  id v7 = [(NSArray *)sinfs countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7)
  {
LABEL_13:
    v15 = (void *)SSError();
    id result = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_14;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v18;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v18 != v9) {
      objc_enumerationMutation(sinfs);
    }
    v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
    uint64_t v16 = 0;
    sub_10002E284(v11, a3, &v16);
    if (!v12) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [(NSArray *)sinfs countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_13;
    }
  }
  id v13 = objc_alloc((Class)NSNumber);
  id result = [v13 initWithUnsignedLongLong:v16];
  if (!result) {
    goto LABEL_13;
  }
  v15 = 0;
  if (a4) {
LABEL_14:
  }
    *a4 = v15;
  return result;
}

- (id)copyValueForProperty:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  if (!-[SinfsArray _isRecognizedProperty:](self, "_isRecognizedProperty:")) {
    goto LABEL_14;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  sinfs = self->_sinfs;
  id result = [(NSArray *)sinfs countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (result)
  {
    id v9 = result;
    uint64_t v10 = *(void *)v14;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(sinfs);
      }
      id result = [(SinfsArray *)self _copyValueForSINF:*(void *)(*((void *)&v13 + 1) + 8 * v11) property:a3 error:&v17];
      uint64_t v12 = v17;
      if ((unint64_t)result | v17) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id result = [(NSArray *)sinfs countByEnumeratingWithState:&v13 objects:v18 count:16];
        id v9 = result;
        if (result) {
          goto LABEL_4;
        }
        uint64_t v12 = v17;
        break;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (!((unint64_t)result | v12))
  {
LABEL_14:
    uint64_t v12 = SSError();
    id result = 0;
  }
  if (a4) {
    *a4 = (id)v12;
  }
  return result;
}

- (NSArray)sinfs
{
  v2 = self->_sinfs;

  return v2;
}

- (id)_copyValueForSINF:(id)a3 property:(id)a4 error:(id *)a5
{
  if ([a4 isEqualToString:@"SinfPropertyAccountIdentifier"])
  {
    uint64_t v17 = 0;
    id v8 = a3;
    unint64_t v9 = 2;
LABEL_5:
    sub_10002E284(v8, v9, &v17);
    int v11 = v10;
    uint64_t v12 = 0;
    if (!v10)
    {
      id v13 = objc_alloc((Class)NSNumber);
      uint64_t v12 = (ISFairPlayRentalInfo *)[v13 initWithUnsignedLongLong:v17];
    }
    if (a5 && v11) {
      *a5 = (id)SSError();
    }
    return v12;
  }
  if ([a4 isEqualToString:@"SinfPropertyFairPlayKeyIdentifier"])
  {
    uint64_t v17 = 0;
    id v8 = a3;
    unint64_t v9 = 5;
    goto LABEL_5;
  }
  if (![a4 isEqualToString:@"SinfPropertyRentalInformation"]
    || ![a3 length])
  {
    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v14 = sub_10002ED84();
  sub_1002547B4(v14, (uint64_t)[a3 bytes], (uint64_t)objc_msgSend(a3, "length"), (uint64_t)&v17);
  uint64_t v12 = 0;
  if (!v15)
  {
    uint64_t v12 = objc_alloc_init(ISFairPlayRentalInfo);
    [(ISFairPlayRentalInfo *)v12 setPlaybackDuration:HIDWORD(v18)];
    [(ISFairPlayRentalInfo *)v12 setPlaybackStartTime:v18];
    [(ISFairPlayRentalInfo *)v12 setRentalDuration:HIDWORD(v17)];
    [(ISFairPlayRentalInfo *)v12 setRentalStartTime:v17];
  }
  return v12;
}

- (BOOL)_isRecognizedProperty:(id)a3
{
  if (([a3 isEqualToString:@"SinfPropertyAccountIdentifier"] & 1) != 0
    || ([a3 isEqualToString:@"SinfPropertyFairPlayKeyIdentifier"] & 1) != 0)
  {
    return 1;
  }

  return [a3 isEqualToString:@"SinfPropertyRentalInformation"];
}

@end