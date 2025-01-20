@interface SEMSpanMatchResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpanMatchResult:(id)a3;
- (SEMSpanMatchResult)init;
- (SEMSpanMatchResult)initWithCoder:(id)a3;
- (SEMSpanMatchResult)initWithEntityInfo:(id)a3 spanInfo:(id)a4 fieldMatches:(id)a5 duplicateIndex:(unsigned int)a6;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityInfo;
- (id)fieldMatches;
- (id)spanInfo;
- (id)spanValue;
- (id)toOntologyGraph:(id *)a3;
- (id)toOntologyGraphData:(id *)a3;
- (unint64_t)hash;
- (unsigned)duplicateIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setScore:(float)a3;
@end

@implementation SEMSpanMatchResult

- (SEMSpanMatchResult)initWithEntityInfo:(id)a3 spanInfo:(id)a4 fieldMatches:(id)a5 duplicateIndex:(unsigned int)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v32.receiver = self;
  v32.super_class = (Class)SEMSpanMatchResult;
  v14 = [(SEMSpanMatchResult *)&v32 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_6;
  }
  p_entityInfo = (void **)&v14->_entityInfo;
  objc_storeStrong((id *)&v14->_entityInfo, a3);
  if (objc_msgSend_entityType(*p_entityInfo, v17, v18, v19) != 1)
  {
    uint64_t v24 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      v25 = (SEMSpanInfo *)*p_entityInfo;
      *(_DWORD *)buf = 136315394;
      v34 = "-[SEMSpanMatchResult initWithEntityInfo:spanInfo:fieldMatches:duplicateIndex:]";
      __int16 v35 = 2112;
      v36 = v25;
      v26 = "%s entityInfo invalid: %@";
LABEL_9:
      v27 = v24;
      uint32_t v28 = 22;
LABEL_12:
      _os_log_error_impl(&dword_25C7CA000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
LABEL_14:
    v23 = 0;
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v15->_spanInfo, a4);
  if (!v15->_spanInfo)
  {
    uint64_t v29 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SEMSpanMatchResult initWithEntityInfo:spanInfo:fieldMatches:duplicateIndex:]";
      v26 = "%s spanInfo cannot be nil";
      v27 = v29;
      uint32_t v28 = 12;
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v15->_fieldMatches, a5);
  if (!objc_msgSend_count(v15->_fieldMatches, v20, v21, v22))
  {
    uint64_t v24 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    spanInfo = v15->_spanInfo;
    *(_DWORD *)buf = 136315394;
    v34 = "-[SEMSpanMatchResult initWithEntityInfo:spanInfo:fieldMatches:duplicateIndex:]";
    __int16 v35 = 2112;
    v36 = spanInfo;
    v26 = "%s fieldMatches cannot be nil / empty. spanInfo: %@";
    goto LABEL_9;
  }
  v15->_score = 0.0;
  v15->_duplicateIndex = a6;
LABEL_6:
  v23 = v15;
LABEL_15:

  return v23;
}

- (void)setScore:(float)a3
{
  if (a3 >= 0.0 && a3 <= 1.0) {
    self->_score = a3;
  }
}

- (SEMSpanMatchResult)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)entityInfo
{
  return self->_entityInfo;
}

- (id)spanInfo
{
  return self->_spanInfo;
}

- (id)spanValue
{
  return (id)objc_msgSend_value(self->_spanInfo, a2, v2, v3);
}

- (id)fieldMatches
{
  return self->_fieldMatches;
}

- (float)score
{
  return self->_score;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SEMSpanMatchResult;
  uint64_t v3 = [(SEMSpanMatchResult *)&v8 description];
  v6 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" entityInfo: %@, spanInfo: %@, fieldMatches: %@, duplicate: %u, score: %f", v5, self->_entityInfo, self->_spanInfo, self->_fieldMatches, self->_duplicateIndex, self->_score);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_entityInfo, v9, (uint64_t)a3, v10);
  id v12 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v11;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_spanInfo, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_fieldMatches, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v19;

  *(_DWORD *)(v8 + 36) = self->_duplicateIndex;
  *(float *)(v8 + 32) = self->_score;
  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SEMSpanMatchResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToSpanMatchResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSpanMatchResult = objc_msgSend_isEqualToSpanMatchResult_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToSpanMatchResult = 0;
  }

  return isEqualToSpanMatchResult;
}

- (BOOL)isEqualToSpanMatchResult:(id)a3
{
  id v4 = a3;
  entityInfo = self->_entityInfo;
  v9 = objc_msgSend_entityInfo(v4, v6, v7, v8);
  if (objc_msgSend_isEqual_(entityInfo, v10, (uint64_t)v9, v11))
  {
    spanInfo = self->_spanInfo;
    v16 = objc_msgSend_spanInfo(v4, v12, v13, v14);
    if (objc_msgSend_isEqual_(spanInfo, v17, (uint64_t)v16, v18))
    {
      fieldMatches = self->_fieldMatches;
      v23 = objc_msgSend_fieldMatches(v4, v19, v20, v21);
      if (objc_msgSend_isEqual_(fieldMatches, v24, (uint64_t)v23, v25)
        && (unsigned int duplicateIndex = self->_duplicateIndex,
            duplicateIndex == objc_msgSend_duplicateIndex(v4, v26, v27, v28)))
      {
        float score = self->_score;
        objc_msgSend_score(v4, v30, v31, v32);
        BOOL v35 = score == v34;
      }
      else
      {
        BOOL v35 = 0;
      }
    }
    else
    {
      BOOL v35 = 0;
    }
  }
  else
  {
    BOOL v35 = 0;
  }

  return v35;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_entityInfo, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_spanInfo, v6, v7, v8);
  uint64_t v13 = objc_msgSend_hash(self->_fieldMatches, v10, v11, v12);
  v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v14, self->_duplicateIndex, v15);
  uint64_t v20 = objc_msgSend_hash(v16, v17, v18, v19);
  *(float *)&double v21 = self->_score;
  uint64_t v25 = objc_msgSend_numberWithFloat_(NSNumber, v22, v23, v24, v21);
  unint64_t v29 = v9 ^ v5 ^ v13 ^ v20 ^ objc_msgSend_hash(v25, v26, v27, v28);

  return v29;
}

- (id)toOntologyGraph:(id *)a3
{
  uint64_t v8 = objc_msgSend_ontologyGraphFromSpanMatch_(SEMOntologyMapper, a2, (uint64_t)self, v3);
  if (!v8)
  {
    uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v6, @"No ontology mapping defined for result: %@", v7, self);
    uint64_t v10 = sub_25C813028(0, 5, v9);
    uint64_t v11 = v10;
    if (a3 && v10) {
      *a3 = v10;
    }
  }
  return v8;
}

- (id)toOntologyGraphData:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_toOntologyGraph_(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = v5;
  if (v5)
  {
    objc_msgSend_getCppGraph(v5, v6, v7, v8);
    siri::ontology::UsoGraphProtoWriter::toProtobuf();
    uint64_t v10 = *(void *)v19;
    PB::Writer::Writer((PB::Writer *)v19);
    (*(void (**)(uint64_t, unsigned char *))(*(void *)v10 + 24))(v10, v19);
    uint64_t v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v11, *(uint64_t *)&v19[8], *(void *)v19 - *(void *)&v19[8]);
    PB::Writer::~Writer((PB::Writer *)v19);
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  else
  {
    uint64_t v13 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend_description(self, v14, v15, v16);
      *(_DWORD *)uint64_t v19 = 136315394;
      *(void *)&v19[4] = "-[SEMSpanMatchResult toOntologyGraphData:]";
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v18;
      _os_log_error_impl(&dword_25C7CA000, v13, OS_LOG_TYPE_ERROR, "%s No ontology graph found for result: %@", v19, 0x16u);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMSpanMatchResult)initWithCoder:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SEMSpanMatchResult;
  uint64_t v5 = [(SEMSpanMatchResult *)&v29 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v30[0] = objc_opt_class();
    uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v7, (uint64_t)v30, 1);
    uint64_t v11 = objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8, v10);
    uint64_t v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, @"entityInfo");
    entityInfo = v5->_entityInfo;
    v5->_entityInfo = (SEMEntityInfo *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"spanInfo");
    spanInfo = v5->_spanInfo;
    v5->_spanInfo = (SEMSpanInfo *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v20, v19, @"fieldMatches");
    fieldMatches = v5->_fieldMatches;
    v5->_fieldMatches = (NSArray *)v21;

    v5->_unsigned int duplicateIndex = objc_msgSend_decodeInt32ForKey_(v4, v23, @"duplicateIndex", v24);
    objc_msgSend_decodeFloatForKey_(v4, v25, @"score", v26);
    v5->_float score = v27;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v4, (uint64_t)self->_entityInfo, @"entityInfo");
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)self->_spanInfo, @"spanInfo");
  objc_msgSend_encodeObject_forKey_(v11, v6, (uint64_t)self->_fieldMatches, @"fieldMatches");
  objc_msgSend_encodeInt32_forKey_(v11, v7, self->_duplicateIndex, @"duplicateIndex");
  *(float *)&double v8 = self->_score;
  objc_msgSend_encodeFloat_forKey_(v11, v9, @"score", v10, v8);
}

- (unsigned)duplicateIndex
{
  return self->_duplicateIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldMatches, 0);
  objc_storeStrong((id *)&self->_spanInfo, 0);
  objc_storeStrong((id *)&self->_entityInfo, 0);
}

@end