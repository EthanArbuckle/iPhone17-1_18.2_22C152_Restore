@interface NRDevicePropertyDiff
+ (BOOL)supportsSecureCoding;
+ (id)enclosedClassTypes;
+ (id)packPropertyValue:(id)a3;
+ (id)unpackPropertyValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NRDevicePropertyDiff)initWithCoder:(id)a3;
- (NRDevicePropertyDiff)initWithProtobuf:(id)a3;
- (NRDevicePropertyDiff)initWithValue:(id)a3;
- (NRPBDevicePropertyDiff)protobuf;
- (NSObject)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NRDevicePropertyDiff

- (NRDevicePropertyDiff)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRDevicePropertyDiff;
  v6 = [(NRDevicePropertyDiff *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRDevicePropertyDiff)initWithProtobuf:(id)a3
{
  v4 = a3;
  id v5 = [(NRDevicePropertyDiff *)self init];
  if (v5)
  {
    v6 = objc_opt_class();
    if (v4) {
      v7 = (void *)v4[1];
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
    uint64_t v9 = [v6 unpackPropertyValue:v8];
    value = v5->_value;
    v5->_value = v9;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_value name:@"property value" owner:v5];
  }

  return v5;
}

- (NRPBDevicePropertyDiff)protobuf
{
  v3 = objc_opt_new();
  v4 = [(id)objc_opt_class() packPropertyValue:self->_value];
  -[NRPBDevicePropertyDiff setValue:]((uint64_t)v3, v4);

  return (NRPBDevicePropertyDiff *)v3;
}

- (NRDevicePropertyDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NRDevicePropertyDiff *)self init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v6)
  {
    v10 = +[NRMutableDeviceProperty enclosedClassTypes];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:0x1EF6CB7E0];
    value = v5->_value;
    v5->_value = v11;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_value name:@"property value" owner:v5];
LABEL_5:
    uint64_t v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  id v8 = [[NRPBDevicePropertyDiff alloc] initWithData:v6];
  uint64_t v9 = [(NRDevicePropertyDiff *)v5 initWithProtobuf:v8];

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NRDevicePropertyDiff *)self protobuf];
  id v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"data"];
}

+ (id)enclosedClassTypes
{
  return +[NRMutableDeviceProperty enclosedClassTypes];
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return [self->_value hash] - v3 + 32 * v3 + 961;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NRDevicePropertyDiff *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  value = self->_value;
  if (value == v4->_value) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSObject isEqual:](value, "isEqual:");
  }
LABEL_7:

  return v6;
}

- (id)description
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = +[NRTextFormattingUtilities dateFormatter:self->_value];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    value = self->_value;
    if (isKindOfClass) {
      [value UUIDString];
    }
    else {
    uint64_t v3 = [value description];
    }
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NRDevicePropertyDiff allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_value, self->_value);
  return v4;
}

+ (id)packPropertyValue:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(NRPBPropertyValue);
  if (!v4) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = (void *)MEMORY[0x1E4F28DB0];
    v7 = objc_msgSend(v4, "nr_filteredError");
    objc_msgSend(v6, "nr_secureArchivedDataWithRootObject:", v7);
    id v8 = (NRPBNumber *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [(NRPBPropertyValue *)v5 setDataValue:v8];
      [(NRPBPropertyValue *)v5 setIsError:1];
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_6:

    id v5 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    id v8 = objc_alloc_init(NRPBNumber);
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;

    [(NRPBNumber *)v8 setDoubleValue:v11];
    [(NRPBPropertyValue *)v5 setNumberValue:v8];
    [(NRPBPropertyValue *)v5 setIsDate:1];
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v4;
    v14 = objc_alloc_init(NRPBNumber);
    id v15 = v13;
    if (!strcmp((const char *)[v15 objCType], "i"))
    {
      uint64_t v32 = [v15 intValue];
      v33 = v14;
      goto LABEL_35;
    }
    id v16 = v15;
    if (!strcmp((const char *)[v16 objCType], "I"))
    {
      uint64_t v34 = [v16 unsignedIntValue];
      v35 = v14;
LABEL_41:
      [(NRPBNumber *)v35 setInt32Value:v34];
LABEL_67:
      [(NRPBNumber *)v14 setIsUnsigned:1];
      goto LABEL_68;
    }
    id v17 = v16;
    if (!strcmp((const char *)[v17 objCType], "q"))
    {
      -[NRPBNumber setInt64Value:](v14, "setInt64Value:", [v17 longLongValue]);
      goto LABEL_68;
    }
    id v18 = v17;
    if (!strcmp((const char *)[v18 objCType], "Q"))
    {
      -[NRPBNumber setInt64Value:](v14, "setInt64Value:", [v18 unsignedLongLongValue]);
      goto LABEL_67;
    }
    id v19 = v18;
    if (!strcmp((const char *)[v19 objCType], "s"))
    {
      -[NRPBNumber setInt32Value:](v14, "setInt32Value:", [v19 shortValue]);
      v36 = v14;
      uint64_t v37 = 1;
    }
    else
    {
      id v20 = v19;
      if (!strcmp((const char *)[v20 objCType], "S"))
      {
        -[NRPBNumber setInt32Value:](v14, "setInt32Value:", [v20 unsignedShortValue]);
        v38 = v14;
        uint64_t v39 = 1;
        goto LABEL_66;
      }
      id v21 = v20;
      if (strcmp((const char *)[v21 objCType], "c"))
      {
        id v22 = v21;
        if (strcmp((const char *)[v22 objCType], "C"))
        {
          id v23 = v22;
          if (strcmp((const char *)[v23 objCType], "q"))
          {
            id v24 = v23;
            if (strcmp((const char *)[v24 objCType], "Q"))
            {
              id v25 = v24;
              if (!strcmp((const char *)[v25 objCType], "B"))
              {
                -[NRPBNumber setBoolValue:](v14, "setBoolValue:", [v25 BOOLValue]);
              }
              else
              {
                id v26 = v25;
                if (strcmp((const char *)[v26 objCType], "f"))
                {
                  id v27 = v26;
                  if (!strcmp((const char *)[v27 objCType], "d"))
                  {
                    [v27 doubleValue];
                    -[NRPBNumber setDoubleValue:](v14, "setDoubleValue:");
                    goto LABEL_68;
                  }
LABEL_70:

                  goto LABEL_71;
                }
                [v26 floatValue];
                -[NRPBNumber setFloatValue:](v14, "setFloatValue:");
              }
LABEL_68:
              if (v14)
              {
                [(NRPBPropertyValue *)v5 setNumberValue:v14];
                goto LABEL_70;
              }
LABEL_71:

              goto LABEL_10;
            }
            uint64_t v34 = [v24 unsignedIntegerValue];
            v35 = v14;
            goto LABEL_41;
          }
          uint64_t v32 = [v23 integerValue];
          v33 = v14;
LABEL_35:
          [(NRPBNumber *)v33 setInt32Value:v32];
          goto LABEL_68;
        }
        -[NRPBNumber setInt32Value:](v14, "setInt32Value:", [v22 unsignedCharValue]);
        v38 = v14;
        uint64_t v39 = 0;
LABEL_66:
        [(NRPBNumber *)v38 setIsShortOrChar:v39];
        goto LABEL_67;
      }
      -[NRPBNumber setInt32Value:](v14, "setInt32Value:", [v21 charValue]);
      v36 = v14;
      uint64_t v37 = 0;
    }
    [(NRPBNumber *)v36 setIsShortOrChar:v37];
    goto LABEL_68;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v4;
    v14 = objc_alloc_init(NRPBSize);
    id v15 = v28;
    if (!strcmp((const char *)[v15 objCType], "{CGSize=dd}"))
    {
      [v15 sizeValue];
      *(float *)&double v29 = v29;
      [(NRPBNumber *)v14 setWidth:v29];
      [v15 sizeValue];
      *(float *)&double v31 = v30;
      [(NRPBNumber *)v14 setHeight:v31];
      if (!v14) {
        goto LABEL_71;
      }
      [(NRPBPropertyValue *)v5 setSizeValue:v14];
    }
    goto LABEL_70;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NRPBPropertyValue *)v5 setStringValue:v4];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NRPBPropertyValue *)v5 setIsSecurePropertyValue:1];
      [v4 data];
    }
    else
    {
      [MEMORY[0x1E4F1C9B8] fromUUID:v4];
    }
    id v8 = (NRPBNumber *)objc_claimAutoreleasedReturnValue();
    [(NRPBPropertyValue *)v5 setUUIDValue:v8];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NRPBPropertyValue *)v5 setDataValue:v4];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v4;
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NRPBPropertyValue *)v5 setArrayValues:v41];

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v15 = v40;
    uint64_t v42 = [v15 countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v84 != v44) {
            objc_enumerationMutation(v15);
          }
          v46 = [a1 packPropertyValue:*(void *)(*((void *)&v83 + 1) + 8 * i)];
          if (v46)
          {
            v47 = [(NRPBPropertyValue *)v5 arrayValues];
            [v47 addObject:v46];
          }
        }
        uint64_t v43 = [v15 countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v43);
    }

LABEL_85:
    v57 = [(NRPBPropertyValue *)v5 arrayValues];
    uint64_t v58 = [v57 count];

    if (!v58) {
      [(NRPBPropertyValue *)v5 setArrayValues:0];
    }
    goto LABEL_71;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v48 = v4;
    [(NRPBPropertyValue *)v5 setIsMiniUUIDSet:1];
    id v15 = [v48 data];

    [(NRPBPropertyValue *)v5 setDataValue:v15];
    goto LABEL_71;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v49 = v4;
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NRPBPropertyValue *)v5 setArrayValues:v50];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v15 = v49;
    uint64_t v51 = [v15 countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v80 != v53) {
            objc_enumerationMutation(v15);
          }
          v55 = [a1 packPropertyValue:*(void *)(*((void *)&v79 + 1) + 8 * j)];
          if (v55)
          {
            v56 = [(NRPBPropertyValue *)v5 arrayValues];
            [v56 addObject:v55];
          }
        }
        uint64_t v52 = [v15 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v52);
    }

    [(NRPBPropertyValue *)v5 setIsSet:1];
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v59 = v4;
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NRPBPropertyValue *)v5 setArrayValues:v60];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = [v59 allKeys];
  uint64_t v61 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
  v73 = v59;
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v76;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v76 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = *(void *)(*((void *)&v75 + 1) + 8 * k);
        v66 = objc_msgSend(v59, "objectForKeyedSubscript:", v65, v73);
        v67 = [a1 packPropertyValue:v65];
        if (v67)
        {
          v68 = [a1 packPropertyValue:v66];
          v69 = v68;
          if (v68)
          {
            [v68 setDictionaryKey:v67];
            v70 = [(NRPBPropertyValue *)v5 arrayValues];
            [v70 addObject:v69];

            id v59 = v73;
          }
        }
      }
      uint64_t v62 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v62);
  }

  v71 = [(NRPBPropertyValue *)v5 arrayValues];
  uint64_t v72 = [v71 count];

  if (!v72) {
    [(NRPBPropertyValue *)v5 setArrayValues:0];
  }

LABEL_10:

  return v5;
}

+ (id)unpackPropertyValue:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 numberValue];

  if (v5)
  {
    char v6 = [v4 numberValue];
    int v7 = [v6 hasInt32Value];

    id v8 = [v4 numberValue];
    id v9 = v8;
    if (v7)
    {
      int v10 = [v8 hasIsShortOrChar];

      double v11 = [v4 numberValue];
      v12 = v11;
      if (v10)
      {
        int v13 = [v11 isShortOrChar];

        v14 = [v4 numberValue];
        int v15 = [v14 isUnsigned];

        id v16 = NSNumber;
        id v17 = [v4 numberValue];
        unsigned __int16 v18 = [v17 int32Value];
        if (v13)
        {
          if (v15) {
            [v16 numberWithUnsignedShort:v18];
          }
          else {
            [v16 numberWithShort:(__int16)v18];
          }
        }
        else if (v15)
        {
          [v16 numberWithUnsignedChar:v18];
        }
        else
        {
          [v16 numberWithChar:(char)v18];
        }
      }
      else
      {
        int v34 = [v11 isUnsigned];

        v35 = NSNumber;
        id v17 = [v4 numberValue];
        uint64_t v36 = [v17 int32Value];
        if (v34) {
          [v35 numberWithUnsignedInt:v36];
        }
        else {
          [v35 numberWithInt:v36];
        }
      }
    }
    else
    {
      int v28 = [v8 hasInt64Value];

      double v29 = [v4 numberValue];
      double v30 = v29;
      if (!v28)
      {
        int v37 = [v29 hasFloatValue];

        if (v37)
        {
          v38 = NSNumber;
          id v17 = [v4 numberValue];
          [v17 floatValue];
          uint64_t v39 = objc_msgSend(v38, "numberWithFloat:");
        }
        else
        {
          uint64_t v42 = [v4 numberValue];
          int v43 = [v42 hasDoubleValue];

          if (v43)
          {
            uint64_t v44 = NSNumber;
            id v17 = [v4 numberValue];
            [v17 doubleValue];
            uint64_t v39 = objc_msgSend(v44, "numberWithDouble:");
          }
          else
          {
            id v48 = [v4 numberValue];
            int v49 = [v48 hasBoolValue];

            if (!v49)
            {
              id v21 = 0;
LABEL_35:
              if ([v4 isDate])
              {
                uint64_t v51 = (void *)MEMORY[0x1E4F1C9C8];
                [v21 doubleValue];
                objc_msgSend(v51, "dateWithTimeIntervalSinceReferenceDate:");
                uint64_t v52 = (NRSecureDevicePropertyID *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v52 = v21;
              }
              goto LABEL_38;
            }
            id v50 = NSNumber;
            id v17 = [v4 numberValue];
            uint64_t v39 = objc_msgSend(v50, "numberWithBool:", objc_msgSend(v17, "BOOLValue"));
          }
        }
LABEL_34:
        id v21 = (void *)v39;

        goto LABEL_35;
      }
      int v31 = [v29 isUnsigned];

      uint64_t v32 = NSNumber;
      id v17 = [v4 numberValue];
      uint64_t v33 = [v17 int64Value];
      if (v31) {
        [v32 numberWithUnsignedLongLong:v33];
      }
      else {
        [v32 numberWithLongLong:v33];
      }
    uint64_t v39 = };
    goto LABEL_34;
  }
  id v19 = [v4 sizeValue];

  if (v19)
  {
    id v20 = (void *)MEMORY[0x1E4F29238];
    id v21 = [v4 sizeValue];
    [v21 width];
    double v23 = v22;
    id v24 = [v4 sizeValue];
    [v24 height];
    uint64_t v26 = objc_msgSend(v20, "valueWithSize:", v23, v25);
LABEL_9:
    id v27 = (void *)v26;

LABEL_39:
    goto LABEL_40;
  }
  id v40 = [v4 stringValue];

  if (v40)
  {
    uint64_t v41 = [v4 stringValue];
    goto LABEL_19;
  }
  v45 = [v4 uUIDValue];

  if (v45)
  {
    if (![v4 isSecurePropertyValue])
    {
      id v21 = [v4 uUIDValue];
      uint64_t v52 = [v21 toUUID];
      goto LABEL_38;
    }
    v46 = [NRSecureDevicePropertyID alloc];
    uint64_t v47 = [v4 uUIDValue];
LABEL_46:
    id v21 = (void *)v47;
    uint64_t v52 = [(NRSecureDevicePropertyID *)v46 initWithData:v47];
LABEL_38:
    id v27 = v52;
    goto LABEL_39;
  }
  v54 = [v4 dataValue];

  if (v54)
  {
    if (![v4 isMiniUUIDSet])
    {
      if ([v4 isError])
      {
        uint64_t v72 = (void *)MEMORY[0x1E4F28DC0];
        id v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
        id v24 = [v4 dataValue];
        uint64_t v26 = objc_msgSend(v72, "nr_secureUnarchiveObjectOfClasses:withData:", v21, v24);
        goto LABEL_9;
      }
      uint64_t v41 = [v4 dataValue];
LABEL_19:
      id v27 = (void *)v41;
      goto LABEL_40;
    }
    v46 = [NRMiniUUIDSet alloc];
    uint64_t v47 = [v4 dataValue];
    goto LABEL_46;
  }
  uint64_t v55 = [v4 arrayValues];
  if (!v55
    || (v56 = (void *)v55,
        [v4 arrayValues],
        v57 = objc_claimAutoreleasedReturnValue(),
        uint64_t v58 = [v57 count],
        v57,
        v56,
        !v58))
  {
    id v27 = 0;
    goto LABEL_40;
  }
  id v59 = [v4 arrayValues];
  id v60 = [v59 firstObject];

  uint64_t v61 = [v60 dictionaryKey];

  if (!v61)
  {
    if ([v4 isSet])
    {
      id v62 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      v73 = [v4 arrayValues];
      uint64_t v74 = [v73 countByEnumeratingWithState:&v85 objects:v97 count:16];
      if (v74)
      {
        uint64_t v75 = v74;
        uint64_t v76 = *(void *)v86;
        do
        {
          for (uint64_t i = 0; i != v75; ++i)
          {
            if (*(void *)v86 != v76) {
              objc_enumerationMutation(v73);
            }
            long long v78 = [a1 unpackPropertyValue:*(void *)(*((void *)&v85 + 1) + 8 * i)];
            if (v78) {
              [v62 addObject:v78];
            }
          }
          uint64_t v75 = [v73 countByEnumeratingWithState:&v85 objects:v97 count:16];
        }
        while (v75);
      }
    }
    else
    {
      id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      v73 = [v4 arrayValues];
      uint64_t v79 = [v73 countByEnumeratingWithState:&v89 objects:v98 count:16];
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = *(void *)v90;
        do
        {
          for (uint64_t j = 0; j != v80; ++j)
          {
            if (*(void *)v90 != v81) {
              objc_enumerationMutation(v73);
            }
            long long v83 = [a1 unpackPropertyValue:*(void *)(*((void *)&v89 + 1) + 8 * j)];
            if (v83) {
              [v62 addObject:v83];
            }
          }
          uint64_t v80 = [v73 countByEnumeratingWithState:&v89 objects:v98 count:16];
        }
        while (v80);
      }
    }

    if (![v62 count])
    {
      id v27 = 0;
      goto LABEL_92;
    }
    goto LABEL_91;
  }
  long long v84 = v60;
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v63 = [v4 arrayValues];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v93 objects:v99 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v94;
    do
    {
      for (uint64_t k = 0; k != v65; ++k)
      {
        if (*(void *)v94 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = *(void **)(*((void *)&v93 + 1) + 8 * k);
        v69 = [v68 dictionaryKey];
        v70 = [a1 unpackPropertyValue:v69];

        v71 = [a1 unpackPropertyValue:v68];
        if (v70)
        {
          if (v71) {
            [v62 setObject:v71 forKey:v70];
          }
          else {
            [v62 removeObjectForKey:v70];
          }
        }
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v93 objects:v99 count:16];
    }
    while (v65);
  }

  if ([v62 count])
  {
    id v60 = v84;
LABEL_91:
    id v27 = (void *)[v62 copy];
    goto LABEL_92;
  }
  id v27 = 0;
  id v60 = v84;
LABEL_92:

LABEL_40:

  return v27;
}

- (NSObject)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end