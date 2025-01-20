@interface TransparencyMapEntryVerifier
+ (id)emptyAtDepth:(unint64_t)a3 leafIndex:(id)a4 treeId:(unint64_t)a5;
+ (id)interiorNodeForLeftData:(id)a3 rightData:(id)a4;
+ (id)leafHash:(id)a3 index:(id)a4 treeId:(unint64_t)a5;
+ (id)peerIndexAtDepth:(unint64_t)a3 leafIndex:(id)a4;
+ (void)storeSMHSignatureResult:(unint64_t)a3 smh:(id)a4 error:(id)a5;
- (BOOL)verifyInclusionOfMapLeaf:(id)a3 position:(id)a4 treeHead:(id)a5 treeId:(unint64_t)a6 hashPath:(id)a7 error:(id *)a8;
- (NSData)entryPosition;
- (TransparencyMapEntryVerifier)initWithPositon:(id)a3 trustedKeyStore:(id)a4;
- (TransparencyTrustedKeyStore)trustedKeyStore;
- (unint64_t)verifyMapEntryWithMapLeaf:(id)a3 hashesToRoot:(id)a4 signedMapHead:(id)a5 error:(id *)a6;
- (void)setEntryPosition:(id)a3;
- (void)setTrustedKeyStore:(id)a3;
@end

@implementation TransparencyMapEntryVerifier

- (TransparencyMapEntryVerifier)initWithPositon:(id)a3 trustedKeyStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyMapEntryVerifier;
  v9 = [(TransparencyMapEntryVerifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryPosition, a3);
    objc_storeStrong((id *)&v10->_trustedKeyStore, a4);
  }

  return v10;
}

+ (id)peerIndexAtDepth:(unint64_t)a3 leafIndex:(id)a4
{
  id v5 = a4;
  unint64_t v6 = 8 * (void)[v5 length] - a3;
  id v7 = [v5 mutableCopy];
  [v7 resetBytesInRange:((char *)[v5 length]) - (v6 >> 3), v6 >> 3];
  id v8 = v7;
  id v9 = [v8 bytes];
  unint64_t v10 = ~(v6 >> 3);
  char v13 = *((unsigned char *)[v5 length] + v10 + (void)v9) & (-1 << (v6 & 7)) ^ (1 << (v6 & 7));
  v11 = (char *)[v5 length];

  [v8 replaceBytesInRange:&v11[v10] withBytes:&v13];

  return v8;
}

+ (id)leafHash:(id)a3 index:(id)a4 treeId:(unint64_t)a5
{
  char v15 = 76;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[NSMutableData dataWithBytes:&v15 length:1];
  unint64_t v10 = +[NSData kt_dataWithUint64:a5 length:8];
  [v9 appendData:v10];

  [v9 appendData:v7];
  id v11 = [v7 length];

  objc_super v12 = +[NSData kt_dataWithUint64:8 * (void)v11 length:4];
  [v9 appendData:v12];

  [v9 appendData:v8];
  char v13 = [v9 kt_sha256];

  return v13;
}

+ (id)interiorNodeForLeftData:(id)a3 rightData:(id)a4
{
  id v5 = a4;
  unint64_t v6 = +[NSMutableData dataWithData:a3];
  [v6 appendData:v5];

  id v7 = [v6 kt_sha256];

  return v7;
}

+ (id)emptyAtDepth:(unint64_t)a3 leafIndex:(id)a4 treeId:(unint64_t)a5
{
  char v13 = 69;
  id v7 = +[TransparencyMapEntryVerifier peerIndexAtDepth:a3 leafIndex:a4];
  id v8 = +[NSMutableData dataWithBytes:&v13 length:1];
  id v9 = +[NSData kt_dataWithUint64:a5 length:8];
  [v8 appendData:v9];

  [v8 appendData:v7];
  unint64_t v10 = +[NSData kt_dataWithUint64:a3 length:4];
  [v8 appendData:v10];

  id v11 = [v8 kt_sha256];

  return v11;
}

- (BOOL)verifyInclusionOfMapLeaf:(id)a3 position:(id)a4 treeHead:(id)a5 treeId:(unint64_t)a6 hashPath:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  unint64_t v51 = a6;
  v17 = +[TransparencyMapEntryVerifier leafHash:v13 index:v14 treeId:a6];
  id v18 = [v16 count];
  if (v18 != (id)(8 * (void)[v14 length]))
  {
    if (a8)
    {
      *a8 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-50 description:@"Not enough hashes to match position size"];
    }
    if (qword_10032F278 != -1) {
      dispatch_once(&qword_10032F278, &stru_1002C8D18);
    }
    v35 = qword_10032F280;
    if (os_log_type_enabled((os_log_t)qword_10032F280, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Not enough hashes to match position size", buf, 2u);
    }
    goto LABEL_26;
  }
  v43 = a8;
  v46 = v15;
  v47 = v13;
  v45 = v17;
  id v19 = [v17 copy];
  if ([v14 length])
  {
    uint64_t v20 = 0;
    uint64_t v21 = -1;
    uint64_t v22 = 1;
    id v48 = v14;
    do
    {
      v23 = (unsigned __int8 *)[v14 length];
      uint64_t v49 = v22;
      id v24 = v14;
      uint64_t v25 = 0;
      unsigned int v26 = v23[(void)[v24 bytes] - v22];
      uint64_t v50 = v21;
      uint64_t v27 = 8 * (void)&v23[v21] + 8;
      v28 = v19;
      do
      {
        v29 = [v16 objectAtIndexedSubscript:v20 + v25];
        if (![v29 length])
        {
          id v30 = +[TransparencyMapEntryVerifier emptyAtDepth:v27 leafIndex:v24 treeId:v51];

          v29 = v30;
        }
        if ((v26 >> v25))
        {
          v31 = v29;
          v32 = v28;
        }
        else
        {
          v31 = v28;
          v32 = v29;
        }
        id v19 = +[TransparencyMapEntryVerifier interiorNodeForLeftData:v31 rightData:v32];

        ++v25;
        --v27;
        v28 = v19;
      }
      while (v25 != 8);
      uint64_t v22 = v49 + 1;
      uint64_t v21 = v50 - 1;
      v20 += 8;
      id v14 = v48;
    }
    while (v49 + 1 <= (unint64_t)[v24 length]);
  }
  id v15 = v46;
  unsigned __int8 v33 = [v19 isEqualToData:v46];

  if ((v33 & 1) == 0)
  {
    id v13 = v47;
    if (v43)
    {
      v36 = [v47 kt_hexString];
      v37 = [v46 kt_hexString];
      id *v43 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -45, @"failed to verify inclusion proof for leaf (%@) in head (%@)", v36, v37 code description];
    }
    v17 = v45;
    if (qword_10032F278 != -1) {
      dispatch_once(&qword_10032F278, &stru_1002C8D38);
    }
    v38 = (void *)qword_10032F280;
    if (os_log_type_enabled((os_log_t)qword_10032F280, OS_LOG_TYPE_ERROR))
    {
      v39 = v38;
      v40 = [v45 kt_hexString];
      v41 = [v46 kt_hexString];
      *(_DWORD *)buf = 138412546;
      v53 = v40;
      __int16 v54 = 2112;
      v55 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "failed to verify inclusion proof for leaf hash (%@) in head (%@)", buf, 0x16u);
    }
LABEL_26:
    BOOL v34 = 0;
    goto LABEL_27;
  }
  BOOL v34 = 1;
  id v13 = v47;
  v17 = v45;
LABEL_27:

  return v34;
}

+ (void)storeSMHSignatureResult:(unint64_t)a3 smh:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 dataStore];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001F5388;
  v12[3] = &unk_1002B9D28;
  id v14 = v8;
  unint64_t v15 = a3;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockAndWait:v12];
}

- (unint64_t)verifyMapEntryWithMapLeaf:(id)a3 hashesToRoot:(id)a4 signedMapHead:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v23 = 0;
  unint64_t v13 = (unint64_t)[v12 verifyWithError:&v23];
  id v14 = v23;
  +[TransparencyMapEntryVerifier storeSMHSignatureResult:v13 smh:v12 error:v14];
  if (a6 && v14) {
    *a6 = v14;
  }
  if (v13 == 1)
  {
    entryPosition = self->_entryPosition;
    id v16 = [v12 parsedMapHead];
    v17 = [v16 mapHeadHash];
    id v18 = [v12 parsedMapHead];
    unsigned __int8 v19 = -[TransparencyMapEntryVerifier verifyInclusionOfMapLeaf:position:treeHead:treeId:hashPath:error:](self, "verifyInclusionOfMapLeaf:position:treeHead:treeId:hashPath:error:", v10, entryPosition, v17, [v18 treeId], v11, a6);

    if (v19)
    {
      unint64_t v13 = 1;
    }
    else
    {
      if (a6)
      {
        *a6 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-43 underlyingError:*a6 description:@"failed to verify inclusion proof for map leaf in mapHeadHash"];
      }
      if (qword_10032F278 != -1) {
        dispatch_once(&qword_10032F278, &stru_1002C8D98);
      }
      uint64_t v20 = qword_10032F280;
      if (os_log_type_enabled((os_log_t)qword_10032F280, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to verify inclusion proof for map leaf in mapHeadHash", v22, 2u);
      }
      unint64_t v13 = 0;
    }
  }

  return v13;
}

- (TransparencyTrustedKeyStore)trustedKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrustedKeyStore:(id)a3
{
}

- (NSData)entryPosition
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEntryPosition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPosition, 0);

  objc_storeStrong((id *)&self->_trustedKeyStore, 0);
}

@end