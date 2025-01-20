@interface DMFProfile
- (id)initWithProfile:(id)a3 isManaged:(BOOL)a4 signerCertificates:(id)a5 restrictions:(id)a6;
@end

@implementation DMFProfile

- (id)initWithProfile:(id)a3 isManaged:(BOOL)a4 signerCertificates:(id)a5 restrictions:(id)a6
{
  id v8 = a3;
  id v42 = a5;
  id v40 = a6;
  v41 = v8;
  if ([v8 isEncrypted])
  {
    v9 = 0;
  }
  else
  {
    v10 = [v8 payloads];
    v46 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [0 count]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v49;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v14);
          id v16 = objc_alloc((Class)DMFProfilePayload);
          v17 = [v15 type];
          v18 = [v15 identifier];
          id v19 = [v15 version];
          v20 = [v15 displayName];
          v21 = [v15 organization];
          v22 = [v15 payloadDescription];
          id v23 = [v16 initWithType:v17 identifier:v18 payloadVersion:v19 displayName:v20 organization:v21 payloadDescription:v22];
          [v46 addObject:v23];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v12);
    }

    id v8 = v41;
    v9 = v46;
  }
  v47 = v9;
  BOOL obja = [v8 installType] == (id)2;
  v37 = [v8 UUID];
  v36 = [v8 identifier];
  id v35 = [v8 version];
  v34 = [v8 displayName];
  v33 = [v8 organization];
  v24 = [v8 profileDescription];
  unsigned __int8 v25 = [v8 isLocked];
  v26 = [v8 removalPasscode];
  unsigned __int8 v27 = [v8 isEncrypted];
  id v28 = [v42 copy];
  id v29 = [v9 copy];
  id v30 = [v40 copy];
  BYTE3(v32) = v27;
  BYTE2(v32) = v26 != 0;
  BYTE1(v32) = v25;
  LOBYTE(v32) = a4;
  objb = -[DMFProfile initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:hasRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:](self, "initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:hasRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:", v37, obja, v36, v35, v34, v33, v24, v32, v28, v29, v30);

  return objb;
}

@end