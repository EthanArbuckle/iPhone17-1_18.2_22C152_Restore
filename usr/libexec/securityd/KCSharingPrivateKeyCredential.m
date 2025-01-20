@interface KCSharingPrivateKeyCredential
+ (NSSet)requiredAttributeKeys;
+ (const)databaseItemClass;
- (BOOL)isEqual:(id)a3;
- (KCSharingPrivateKeyCredential)initWithAttributes:(id)a3 error:(id *)a4;
- (KCSharingPrivateKeyCredential)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (KCSharingPrivateKeyCredential)initWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5;
- (NSData)applicationLabel;
- (NSData)applicationTag;
- (NSData)keyMaterial;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)accessGroup;
- (NSString)description;
- (NSString)label;
- (NSString)sharingGroup;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
- (id)proto;
- (int64_t)effectiveKeySize;
- (int64_t)keySizeInBits;
- (int64_t)keyType;
- (unint64_t)hash;
@end

@implementation KCSharingPrivateKeyCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_keyMaterial, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_applicationTag, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);

  objc_storeStrong((id *)&self->_sharingGroup, 0);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)effectiveKeySize
{
  return self->_effectiveKeySize;
}

- (int64_t)keySizeInBits
{
  return self->_keySizeInBits;
}

- (NSData)keyMaterial
{
  return self->_keyMaterial;
}

- (NSData)applicationLabel
{
  return self->_applicationLabel;
}

- (NSString)label
{
  return self->_label;
}

- (NSData)applicationTag
{
  return self->_applicationTag;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (NSString)sharingGroup
{
  return self->_sharingGroup;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  v18[0] = kSecAttrSharingGroup;
  v17 = [(KCSharingPrivateKeyCredential *)self sharingGroup];
  v19[0] = v17;
  v18[1] = kSecAttrKeyType;
  v16 = +[NSNumber numberWithInteger:[(KCSharingPrivateKeyCredential *)self keyType]];
  v19[1] = v16;
  v18[2] = kSecAttrApplicationTag;
  v5 = [(KCSharingPrivateKeyCredential *)self applicationTag];
  v19[2] = v5;
  v18[3] = kSecAttrLabel;
  v6 = [(KCSharingPrivateKeyCredential *)self label];
  v19[3] = v6;
  v18[4] = kSecAttrApplicationLabel;
  v7 = [(KCSharingPrivateKeyCredential *)self applicationLabel];
  v19[4] = v7;
  v18[5] = kSecValueData;
  v8 = [(KCSharingPrivateKeyCredential *)self keyMaterial];
  v19[5] = v8;
  v18[6] = kSecAttrKeySizeInBits;
  v9 = +[NSNumber numberWithInteger:[(KCSharingPrivateKeyCredential *)self keySizeInBits]];
  v19[6] = v9;
  v18[7] = kSecAttrEffectiveKeySize;
  v10 = +[NSNumber numberWithInteger:[(KCSharingPrivateKeyCredential *)self effectiveKeySize]];
  v19[7] = v10;
  v18[8] = kSecAttrCreationDate;
  v11 = [(KCSharingPrivateKeyCredential *)self creationDate];
  v19[8] = v11;
  v18[9] = kSecAttrModificationDate;
  v12 = [(KCSharingPrivateKeyCredential *)self modificationDate];
  v19[9] = v12;
  v19[10] = &__kCFBooleanFalse;
  v18[10] = kSecAttrSynchronizable;
  v18[11] = kSecAttrAccessible;
  v19[11] = kSecAttrAccessibleWhenUnlocked;
  v18[12] = kSecAttrAccessGroup;
  v13 = [(KCSharingPrivateKeyCredential *)self accessGroup];
  v19[12] = v13;
  v19[13] = kSecAttrKeyClassPrivate;
  v18[13] = kSecAttrKeyClass;
  v18[14] = kSecAttrIsPermanent;
  v19[14] = &__kCFBooleanTrue;
  v19[15] = &__kCFBooleanTrue;
  v18[15] = kSecAttrIsPrivate;
  v18[16] = kSecAttrIsModifiable;
  v19[16] = &__kCFBooleanTrue;
  v19[17] = &__kCFBooleanFalse;
  v18[17] = kSecAttrIsSensitive;
  v18[18] = kSecAttrWasAlwaysSensitive;
  v19[18] = &__kCFBooleanFalse;
  v19[19] = &__kCFBooleanTrue;
  v18[19] = kSecAttrIsExtractable;
  v18[20] = kSecAttrWasNeverExtractable;
  v19[20] = &__kCFBooleanFalse;
  v19[21] = &__kCFBooleanFalse;
  v18[21] = kSecAttrCanEncrypt;
  v18[22] = kSecAttrCanDecrypt;
  v19[22] = &__kCFBooleanTrue;
  v19[23] = &__kCFBooleanTrue;
  v18[23] = kSecAttrCanDerive;
  v18[24] = kSecAttrCanSign;
  v19[24] = &__kCFBooleanTrue;
  v19[25] = &__kCFBooleanFalse;
  v18[25] = kSecAttrCanVerify;
  v18[26] = kSecAttrCanSignRecover;
  v19[26] = &__kCFBooleanFalse;
  v19[27] = &__kCFBooleanFalse;
  v18[27] = kSecAttrCanVerifyRecover;
  v18[28] = kSecAttrCanWrap;
  v18[29] = kSecAttrCanUnwrap;
  v19[28] = &__kCFBooleanFalse;
  v19[29] = &__kCFBooleanTrue;
  v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:30];

  return v14;
}

- (id)proto
{
  v3 = objc_opt_new();
  v4 = [(KCSharingPrivateKeyCredential *)self accessGroup];
  [v3 setAccessGroup:v4];

  [v3 setKeyType:-[KCSharingPrivateKeyCredential keyType](self, "keyType")];
  v5 = [(KCSharingPrivateKeyCredential *)self applicationTag];
  [v3 setApplicationTag:v5];

  v6 = [(KCSharingPrivateKeyCredential *)self label];
  [v3 setLabel:v6];

  v7 = [(KCSharingPrivateKeyCredential *)self applicationLabel];
  [v3 setApplicationLabel:v7];

  v8 = [(KCSharingPrivateKeyCredential *)self keyMaterial];
  [v3 setKeyMaterial:v8];

  [v3 setKeySizeInBits:-[KCSharingPrivateKeyCredential keySizeInBits](self, "keySizeInBits")];
  [v3 setEffectiveKeySize:-[KCSharingPrivateKeyCredential effectiveKeySize](self, "effectiveKeySize")];
  v9 = [(KCSharingPrivateKeyCredential *)self creationDate];
  [v9 timeIntervalSinceReferenceDate];
  [v3 setCreationDate:];

  v10 = [(KCSharingPrivateKeyCredential *)self modificationDate];
  [v10 timeIntervalSinceReferenceDate];
  [v3 setModificationDate:];

  return v3;
}

- (NSString)description
{
  v3 = [(KCSharingPrivateKeyCredential *)self sharingGroup];
  v4 = [(KCSharingPrivateKeyCredential *)self accessGroup];
  int64_t v5 = [(KCSharingPrivateKeyCredential *)self keyType];
  v6 = [(KCSharingPrivateKeyCredential *)self applicationTag];
  v7 = [(KCSharingPrivateKeyCredential *)self label];
  v8 = [(KCSharingPrivateKeyCredential *)self applicationLabel];
  int64_t v9 = [(KCSharingPrivateKeyCredential *)self keySizeInBits];
  int64_t v10 = [(KCSharingPrivateKeyCredential *)self effectiveKeySize];
  v11 = [(KCSharingPrivateKeyCredential *)self creationDate];
  v12 = [(KCSharingPrivateKeyCredential *)self modificationDate];
  v13 = +[NSString stringWithFormat:@"KCSharingPrivateKeyCredential(sharingGroup:%@ accessGroup:%@ keyType:%ld applicationTag:%@ label:%@ applicationLabel:%@ keySizeInBits:%ld effectiveKeySize:%ld creationDate:%@ modificationDate:%@)", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KCSharingPrivateKeyCredential *)a3;
  if (v4 == self)
  {
    unsigned __int8 v19 = 1;
  }
  else if ([(KCSharingPrivateKeyCredential *)v4 isMemberOfClass:objc_opt_class()])
  {
    int64_t v5 = v4;
    v6 = [(KCSharingPrivateKeyCredential *)self sharingGroup];
    v7 = [(KCSharingPrivateKeyCredential *)v5 sharingGroup];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(KCSharingPrivateKeyCredential *)self accessGroup];
      int64_t v9 = [(KCSharingPrivateKeyCredential *)v5 accessGroup];
      if ([v8 isEqualToString:v9]
        && (id v10 = [(KCSharingPrivateKeyCredential *)self keyType],
            v10 == (id)[(KCSharingPrivateKeyCredential *)v5 keyType]))
      {
        v11 = [(KCSharingPrivateKeyCredential *)self applicationTag];
        v12 = [(KCSharingPrivateKeyCredential *)v5 applicationTag];
        if ([v11 isEqualToData:v12])
        {
          v13 = [(KCSharingPrivateKeyCredential *)self label];
          v30 = [(KCSharingPrivateKeyCredential *)v5 label];
          v31 = v13;
          if ([v13 isEqualToString:v30])
          {
            v14 = [(KCSharingPrivateKeyCredential *)self applicationLabel];
            v28 = [(KCSharingPrivateKeyCredential *)v5 applicationLabel];
            v29 = v14;
            if ([v14 isEqualToData:v28])
            {
              uint64_t v15 = [(KCSharingPrivateKeyCredential *)self keyMaterial];
              uint64_t v16 = [(KCSharingPrivateKeyCredential *)v5 keyMaterial];
              v27 = (void *)v15;
              v17 = (void *)v15;
              v18 = (void *)v16;
              if ([v17 isEqualToData:v16]
                && (id v24 = [(KCSharingPrivateKeyCredential *)self keySizeInBits],
                    v24 == (id)[(KCSharingPrivateKeyCredential *)v5 keySizeInBits])
                && (id v25 = [(KCSharingPrivateKeyCredential *)self effectiveKeySize],
                    v25 == (id)[(KCSharingPrivateKeyCredential *)v5 effectiveKeySize]))
              {
                v26 = [(KCSharingPrivateKeyCredential *)self creationDate];
                v23 = [(KCSharingPrivateKeyCredential *)v5 creationDate];
                if (objc_msgSend(v26, "isEqualToDate:"))
                {
                  v22 = [(KCSharingPrivateKeyCredential *)self modificationDate];
                  v21 = [(KCSharingPrivateKeyCredential *)v5 modificationDate];
                  unsigned __int8 v19 = [v22 isEqualToDate:v21];
                }
                else
                {
                  unsigned __int8 v19 = 0;
                }
              }
              else
              {
                unsigned __int8 v19 = 0;
              }
            }
            else
            {
              unsigned __int8 v19 = 0;
            }
          }
          else
          {
            unsigned __int8 v19 = 0;
          }
        }
        else
        {
          unsigned __int8 v19 = 0;
        }
      }
      else
      {
        unsigned __int8 v19 = 0;
      }
    }
    else
    {
      unsigned __int8 v19 = 0;
    }
  }
  else
  {
    unsigned __int8 v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  v3 = [(KCSharingPrivateKeyCredential *)self sharingGroup];
  id v4 = [v3 hash];

  int64_t v5 = [(KCSharingPrivateKeyCredential *)self accessGroup];
  int64_t v6 = (unsigned char *)[v5 hash] - (unsigned char *)v4 + 32 * (void)v4;

  int64_t v7 = [(KCSharingPrivateKeyCredential *)self keyType] + 32 * v6 - v6;
  v8 = [(KCSharingPrivateKeyCredential *)self applicationTag];
  int64_t v9 = (int64_t)[v8 hash] + 32 * v7 - v7;

  id v10 = [(KCSharingPrivateKeyCredential *)self label];
  int64_t v11 = (int64_t)[v10 hash] + 32 * v9 - v9;

  v12 = [(KCSharingPrivateKeyCredential *)self applicationLabel];
  int64_t v13 = (int64_t)[v12 hash] + 32 * v11 - v11;

  v14 = [(KCSharingPrivateKeyCredential *)self keyMaterial];
  int64_t v15 = (int64_t)[v14 hash] + 32 * v13 - v13;

  int64_t v16 = [(KCSharingPrivateKeyCredential *)self keySizeInBits] + 32 * v15 - v15;
  int64_t v17 = [(KCSharingPrivateKeyCredential *)self effectiveKeySize] + 32 * v16 - v16;
  v18 = [(KCSharingPrivateKeyCredential *)self creationDate];
  int64_t v19 = (int64_t)[v18 hash] + 32 * v17 - v17;

  v20 = [(KCSharingPrivateKeyCredential *)self modificationDate];
  v21 = (char *)[v20 hash] + 32 * v19 - v19;

  return (unint64_t)v21;
}

- (KCSharingPrivateKeyCredential)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v81.receiver = self;
  v81.super_class = (Class)KCSharingPrivateKeyCredential;
  int64_t v7 = [(KCSharingPrivateKeyCredential *)&v81 init];
  if (!v7) {
    goto LABEL_51;
  }
  uint64_t v8 = kSecAttrSharingGroup;
  int64_t v9 = [v6 objectForKeyedSubscript:kSecAttrSharingGroup];
  if (!v9)
  {
    CFStringRef v144 = @"KCSharingMissingAttribute";
    uint64_t v145 = v8;
    id v10 = +[NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v10);
LABEL_36:

    goto LABEL_37;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    CFStringRef v142 = @"KCSharingInvalidAttribute";
    uint64_t v140 = v8;
    id v10 = [v9 copy];
    id v141 = v10;
    id v36 = +[NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
    id v143 = v36;
    v37 = +[NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v37);
LABEL_34:

    goto LABEL_35;
  }
  id v10 = [v6 objectForKeyedSubscript:kSecAttrAccessGroup];
  if (!v10)
  {
    CFStringRef v138 = @"KCSharingMissingAttribute";
    CFStringRef v139 = kSecAttrAccessGroup;
    id v36 = +[NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v36);
LABEL_35:

    goto LABEL_36;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    CFStringRef v136 = @"KCSharingInvalidAttribute";
    CFStringRef v134 = kSecAttrAccessGroup;
    id v36 = [v10 copy];
    id v135 = v36;
    v37 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
    v137 = v37;
    v38 = +[NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v38);

    goto LABEL_34;
  }
  int64_t v11 = [v6 objectForKeyedSubscript:kSecAttrKeyType];
  if (!v11)
  {
    CFStringRef v132 = @"KCSharingMissingAttribute";
    CFStringRef v133 = kSecAttrKeyType;
    int v34 = 1;
    id v12 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v12);
    goto LABEL_50;
  }
  if ((_NSIsNSString() & 1) == 0 && (_NSIsNSNumber() & 1) == 0)
  {
    CFStringRef v130 = @"KCSharingInvalidAttribute";
    CFStringRef v128 = kSecAttrKeyType;
    id v12 = [v11 copy];
    id v129 = v12;
    v43 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
    v131 = v43;
    v44 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v44);

    int v34 = 1;
    goto LABEL_50;
  }
  id v12 = [v6 objectForKeyedSubscript:kSecAttrApplicationTag];
  if (v12)
  {
    if (_NSIsNSData() && [v12 length])
    {
      int64_t v13 = [v6 objectForKeyedSubscript:kSecAttrLabel];
      if (v13)
      {
        if (_NSIsNSString())
        {
          v77 = v13;
          v14 = [v6 objectForKeyedSubscript:kSecAttrApplicationLabel];
          if (v14)
          {
            if (_NSIsNSData() && [v14 length])
            {
              uint64_t v15 = [v6 objectForKeyedSubscript:kSecValueData];
              v74 = (void *)v15;
              if (v15)
              {
                int64_t v16 = (void *)v15;
                v75 = v14;
                if (_NSIsNSData() && [v16 length])
                {
                  v78 = v11;
                  v72 = v12;
                  v73 = [v6 objectForKeyedSubscript:kSecAttrKeySizeInBits];
                  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString())
                  {
                    id v17 = [v6 objectForKeyedSubscript:kSecAttrEffectiveKeySize];
                    if (v17)
                    {
                      if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString())
                      {
                        id v18 = [v6 objectForKeyedSubscript:kSecAttrCreationDate];
                        if (v18)
                        {
                          if (_NSIsNSDate())
                          {
                            v69 = [v6 objectForKeyedSubscript:kSecAttrModificationDate];
                            if (v69)
                            {
                              if (_NSIsNSDate())
                              {
                                int64_t v19 = (NSString *)[v9 copy];
                                sharingGroup = v7->_sharingGroup;
                                v7->_sharingGroup = v19;

                                v21 = (NSString *)[v10 copy];
                                accessGroup = v7->_accessGroup;
                                v7->_accessGroup = v21;

                                v7->_keyType = (int)[v78 intValue];
                                v23 = (NSData *)[v72 copy];
                                applicationTag = v7->_applicationTag;
                                v7->_applicationTag = v23;

                                id v25 = (NSString *)[v13 copy];
                                label = v7->_label;
                                v7->_label = v25;

                                v27 = (NSData *)[v14 copy];
                                applicationLabel = v7->_applicationLabel;
                                v7->_applicationLabel = v27;

                                v29 = (NSData *)[v74 copy];
                                keyMaterial = v7->_keyMaterial;
                                v7->_keyMaterial = v29;

                                v7->_keySizeInBits = (int64_t)[v73 integerValue];
                                v7->_effectiveKeySize = (int64_t)[v17 integerValue];
                                v31 = (NSDate *)[v18 copy];
                                creationDate = v7->_creationDate;
                                v7->_creationDate = v31;

                                v33 = (NSDate *)[v69 copy];
                                int v34 = 0;
                                id modificationDate = v7->_modificationDate;
                                v7->_id modificationDate = v33;
                              }
                              else
                              {
                                CFStringRef v84 = @"KCSharingInvalidAttribute";
                                CFStringRef v82 = kSecAttrModificationDate;
                                id modificationDate = [v69 copy];
                                id v83 = modificationDate;
                                v67 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
                                v85 = v67;
                                v68 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
                                sub_100046FBC(a4, 1, (uint64_t)v68);

                                int v34 = 1;
                              }
                            }
                            else
                            {
                              CFStringRef v86 = @"KCSharingMissingAttribute";
                              CFStringRef v87 = kSecAttrModificationDate;
                              int v34 = 1;
                              id modificationDate = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
                              sub_100046FBC(a4, 22, (uint64_t)modificationDate);
                            }
                          }
                          else
                          {
                            CFStringRef v90 = @"KCSharingInvalidAttribute";
                            CFStringRef v88 = kSecAttrCreationDate;
                            id v71 = [v18 copy];
                            id v89 = v71;
                            v65 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
                            v91 = v65;
                            v66 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
                            sub_100046FBC(a4, 1, (uint64_t)v66);

                            int v34 = 1;
                          }
                        }
                        else
                        {
                          CFStringRef v92 = @"KCSharingMissingAttribute";
                          CFStringRef v93 = kSecAttrCreationDate;
                          int v34 = 1;
                          v70 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
                          sub_100046FBC(a4, 22, (uint64_t)v70);
                        }
                      }
                      else
                      {
                        CFStringRef v96 = @"KCSharingInvalidAttribute";
                        CFStringRef v94 = kSecAttrEffectiveKeySize;
                        id v18 = [v17 copy];
                        id v95 = v18;
                        v63 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
                        v97 = v63;
                        v64 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
                        sub_100046FBC(a4, 1, (uint64_t)v64);

                        int v34 = 1;
                      }
                    }
                    else
                    {
                      CFStringRef v98 = @"KCSharingMissingAttribute";
                      CFStringRef v99 = kSecAttrEffectiveKeySize;
                      int v34 = 1;
                      id v18 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
                      sub_100046FBC(a4, 22, (uint64_t)v18);
                    }
                  }
                  else
                  {
                    CFStringRef v102 = @"KCSharingInvalidAttribute";
                    CFStringRef v100 = kSecAttrKeySizeInBits;
                    id v17 = [v73 copy];
                    id v101 = v17;
                    id v18 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
                    id v103 = v18;
                    v62 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
                    sub_100046FBC(a4, 1, (uint64_t)v62);

                    int v34 = 1;
                  }

                  id v12 = v72;
                  v61 = v73;
                  int64_t v11 = v78;
                }
                else
                {
                  CFStringRef v106 = @"KCSharingInvalidAttribute";
                  CFStringRef v104 = kSecValueData;
                  id v58 = [v16 copy];
                  id v105 = v58;
                  v59 = +[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
                  v107 = v59;
                  v60 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
                  sub_100046FBC(a4, 1, (uint64_t)v60);

                  v61 = v58;
                  int v34 = 1;
                }
                v14 = v75;
              }
              else
              {
                CFStringRef v108 = @"KCSharingMissingAttribute";
                CFStringRef v109 = kSecValueData;
                int v34 = 1;
                v61 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
                sub_100046FBC(a4, 22, (uint64_t)v61);
              }

              int64_t v13 = v77;
              v54 = v74;
              goto LABEL_47;
            }
            CFStringRef v112 = @"KCSharingInvalidAttribute";
            CFStringRef v110 = kSecAttrApplicationLabel;
            id v50 = [v14 copy];
            id v111 = v50;
            +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
            v51 = v76 = v14;
            v113 = v51;
            v52 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
            v53 = a4;
            v54 = v50;
            sub_100046FBC(v53, 1, (uint64_t)v52);

            v14 = v76;
            int v34 = 1;
          }
          else
          {
            CFStringRef v114 = @"KCSharingMissingAttribute";
            CFStringRef v115 = kSecAttrApplicationLabel;
            int v34 = 1;
            uint64_t v55 = +[NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
            v56 = a4;
            v54 = (void *)v55;
            sub_100046FBC(v56, 22, v55);
          }
          int64_t v13 = v77;
LABEL_47:

          goto LABEL_48;
        }
        CFStringRef v118 = @"KCSharingInvalidAttribute";
        CFStringRef v116 = kSecAttrLabel;
        id v45 = [v13 copy];
        id v117 = v45;
        +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        v80 = v11;
        id v46 = v12;
        v48 = v47 = v13;
        v119 = v48;
        v49 = +[NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
        sub_100046FBC(a4, 1, (uint64_t)v49);

        v14 = v45;
        int64_t v13 = v47;
        id v12 = v46;
        int64_t v11 = v80;
        int v34 = 1;
      }
      else
      {
        CFStringRef v120 = @"KCSharingMissingAttribute";
        CFStringRef v121 = kSecAttrLabel;
        int v34 = 1;
        v14 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
        sub_100046FBC(a4, 22, (uint64_t)v14);
      }
    }
    else
    {
      CFStringRef v124 = @"KCSharingInvalidAttribute";
      CFStringRef v122 = kSecAttrApplicationTag;
      v79 = v11;
      id v40 = v12;
      id v41 = [v12 copy];
      id v123 = v41;
      int v34 = 1;
      v14 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
      v125 = v14;
      v42 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
      sub_100046FBC(a4, 1, (uint64_t)v42);

      int64_t v13 = v41;
      id v12 = v40;
      int64_t v11 = v79;
    }
LABEL_48:

    goto LABEL_49;
  }
  CFStringRef v126 = @"KCSharingMissingAttribute";
  CFStringRef v127 = kSecAttrApplicationTag;
  int v34 = 1;
  int64_t v13 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
  sub_100046FBC(a4, 22, (uint64_t)v13);
LABEL_49:

LABEL_50:
  if (!v34)
  {
LABEL_51:
    v39 = v7;
    goto LABEL_52;
  }
LABEL_37:
  v39 = 0;
LABEL_52:

  return v39;
}

- (KCSharingPrivateKeyCredential)initWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)KCSharingPrivateKeyCredential;
  int64_t v9 = [(KCSharingPrivateKeyCredential *)&v32 init];
  if (v9)
  {
    id v10 = (NSString *)[v8 copy];
    sharingGroup = v9->_sharingGroup;
    v9->_sharingGroup = v10;

    id v12 = [v7 accessGroup];
    int64_t v13 = (NSString *)[v12 copy];
    accessGroup = v9->_accessGroup;
    v9->_accessGroup = v13;

    v9->_keyType = (int64_t)[v7 keyType];
    uint64_t v15 = [v7 applicationTag];
    int64_t v16 = (NSData *)[v15 copy];
    applicationTag = v9->_applicationTag;
    v9->_applicationTag = v16;

    id v18 = [v7 label];
    int64_t v19 = (NSString *)[v18 copy];
    label = v9->_label;
    v9->_label = v19;

    v21 = [v7 applicationLabel];
    v22 = (NSData *)[v21 copy];
    applicationLabel = v9->_applicationLabel;
    v9->_applicationLabel = v22;

    id v24 = [v7 keyMaterial];
    id v25 = (NSData *)[v24 copy];
    keyMaterial = v9->_keyMaterial;
    v9->_keyMaterial = v25;

    v9->_keySizeInBits = (int64_t)[v7 keySizeInBits];
    v9->_effectiveKeySize = (int64_t)[v7 effectiveKeySize];
    [v7 creationDate];
    uint64_t v27 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v27;

    [v7 modificationDate];
    uint64_t v29 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id modificationDate = v9->_modificationDate;
    v9->_id modificationDate = (NSDate *)v29;
  }
  return v9;
}

- (KCSharingPrivateKeyCredential)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  CFSetRef v7 = [(id)objc_opt_class() requiredAttributeKeys];
  id v8 = sub_100155CF8(a3, v7, a4);

  if (v8)
  {
    self = [(KCSharingPrivateKeyCredential *)self initWithAttributes:v8 error:a4];
    int64_t v9 = self;
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

+ (NSSet)requiredAttributeKeys
{
  if (qword_10035CED8 != -1) {
    dispatch_once(&qword_10035CED8, &stru_1002FA7D8);
  }
  v2 = (void *)qword_10035CED0;

  return (NSSet *)v2;
}

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_10000C75C(@"keys", &qword_10035D040, (uint64_t)&unk_10035D038);
}

@end