@interface PPQuickTypeItem
+ (BOOL)supportsSecureCoding;
+ (id)quickTypeItemWithLabel:(id)a3 value:(id)a4 name:(id)a5 date:(id)a6 fields:(unsigned int)a7 originatingBundleID:(id)a8 originatingWebsiteURL:(id)a9 predictionAge:(unint64_t)a10 shouldAggregate:(BOOL)a11 flags:(unsigned __int8)a12 score:(double)a13 source:(unsigned __int8)a14 sourceIdentifier:(id)a15;
- (BOOL)hasScoreSimilarToItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuickTypeItem:(id)a3;
- (BOOL)shouldAggregate;
- (NSDate)date;
- (NSString)label;
- (NSString)name;
- (NSString)originatingBundleID;
- (NSString)sourceIdentifier;
- (NSString)value;
- (NSURL)originatingWebsiteURL;
- (PPQuickTypeItem)initWithCoder:(id)a3;
- (PPQuickTypeItem)initWithLabel:(id)a3 value:(id)a4 name:(id)a5 date:(id)a6 fields:(unsigned int)a7 originatingBundleID:(id)a8 originatingWebsiteURL:(id)a9 predictionAge:(unint64_t)a10 shouldAggregate:(BOOL)a11 flags:(unsigned __int8)a12 score:(double)a13 source:(unsigned __int8)a14 sourceIdentifier:(id)a15;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)reverseCompare:(id)a3;
- (unint64_t)hash;
- (unint64_t)predictionAge;
- (unsigned)fields;
- (unsigned)flags;
- (unsigned)source;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setFields:(unsigned int)a3;
- (void)setFlags:(unsigned __int8)a3;
- (void)setLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginatingBundleID:(id)a3;
- (void)setOriginatingWebsiteURL:(id)a3;
- (void)setPredictionAge:(unint64_t)a3;
- (void)setScore:(double)a3;
- (void)setShouldAggregate:(BOOL)a3;
- (void)setSource:(unsigned __int8)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PPQuickTypeItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingWebsiteURL, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setShouldAggregate:(BOOL)a3
{
  self->_shouldAggregate = a3;
}

- (BOOL)shouldAggregate
{
  return self->_shouldAggregate;
}

- (void)setPredictionAge:(unint64_t)a3
{
  self->_predictionAge = a3;
}

- (unint64_t)predictionAge
{
  return self->_predictionAge;
}

- (void)setOriginatingWebsiteURL:(id)a3
{
}

- (NSURL)originatingWebsiteURL
{
  return self->_originatingWebsiteURL;
}

- (void)setOriginatingBundleID:(id)a3
{
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (void)setFields:(unsigned int)a3
{
  self->_fields = a3;
}

- (unsigned)fields
{
  return self->_fields;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSource:(unsigned __int8)a3
{
  self->_source = a3;
}

- (unsigned)source
{
  return self->_source;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (int64_t)reverseCompare:(id)a3
{
  return [a3 compare:self];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  double score = self->_score;
  [v4 score];
  int64_t v7 = +[PPUtils compareDouble:score withDouble:v6];
  if (!v7)
  {
    label = self->_label;
    v9 = [v4 label];
    int64_t v7 = [(NSString *)label compare:v9];

    if (!v7)
    {
      v10 = self->_name ? self->_name : (NSString *)&stru_1EDA56F70;
      v11 = [v4 name];
      v12 = v11;
      v13 = v11 ? v11 : &stru_1EDA56F70;
      int64_t v7 = [(NSString *)v10 compare:v13];

      if (!v7)
      {
        value = self->_value;
        v15 = [v4 value];
        int64_t v7 = [(NSString *)value compare:v15];

        if (!v7)
        {
          if (self->_sourceIdentifier) {
            sourceIdentifier = (__CFString *)self->_sourceIdentifier;
          }
          else {
            sourceIdentifier = &stru_1EDA56F70;
          }
          uint64_t v17 = [v4 sourceIdentifier];
          v18 = (void *)v17;
          if (v17) {
            v19 = (__CFString *)v17;
          }
          else {
            v19 = &stru_1EDA56F70;
          }
          int64_t v7 = [(__CFString *)sourceIdentifier compare:v19];
        }
      }
    }
  }

  return v7;
}

- (BOOL)isEqualToQuickTypeItem:(id)a3
{
  id v4 = (id *)a3;
  v5 = v4;
  if (!v4 || self->_score != *((double *)v4 + 2) || self->_source != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_34;
  }
  label = self->_label;
  int64_t v7 = (NSString *)v4[4];
  if (label == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = label;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_34:
      char v38 = 0;
      goto LABEL_35;
    }
  }
  value = self->_value;
  v12 = (NSString *)v5[5];
  if (value == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = value;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_34;
    }
  }
  name = self->_name;
  uint64_t v17 = (NSString *)v5[6];
  if (name == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = name;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_34;
    }
  }
  date = self->_date;
  v22 = (NSDate *)v5[7];
  if (date == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = date;
    char v25 = [(NSDate *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_34;
    }
  }
  if (self->_fields != *((_DWORD *)v5 + 3) || self->_flags != *((unsigned __int8 *)v5 + 10)) {
    goto LABEL_34;
  }
  originatingBundleID = self->_originatingBundleID;
  v27 = (NSString *)v5[8];
  if (originatingBundleID == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = originatingBundleID;
    char v30 = [(NSString *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_34;
    }
  }
  originatingWebsiteURL = self->_originatingWebsiteURL;
  v32 = (NSURL *)v5[9];
  if (originatingWebsiteURL == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = originatingWebsiteURL;
    char v35 = [(NSURL *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_34;
    }
  }
  if (self->_predictionAge != v5[10] || self->_shouldAggregate != *((unsigned __int8 *)v5 + 9)) {
    goto LABEL_34;
  }
  v36 = self->_sourceIdentifier;
  v37 = v36;
  if (v36 == v5[3]) {
    char v38 = 1;
  }
  else {
    char v38 = -[NSString isEqual:](v36, "isEqual:");
  }

LABEL_35:
  return v38;
}

- (BOOL)hasScoreSimilarToItem:(id)a3
{
  return vabdd_f64(self->_score, *((double *)a3 + 2)) < 0.000001;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPQuickTypeItem *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPQuickTypeItem *)self isEqualToQuickTypeItem:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 8) = self->_source;
    *(double *)(v5 + 16) = self->_score;
    uint64_t v7 = [(NSString *)self->_sourceIdentifier copyWithZone:a3];
    v8 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v7;

    uint64_t v9 = [(NSString *)self->_label copyWithZone:a3];
    char v10 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v9;

    uint64_t v11 = [(NSString *)self->_value copyWithZone:a3];
    v12 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v11;

    uint64_t v13 = [(NSString *)self->_name copyWithZone:a3];
    v14 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v13;

    uint64_t v15 = [(NSDate *)self->_date copyWithZone:a3];
    v16 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v15;

    *(_DWORD *)(v6 + 12) = self->_fields;
    *(unsigned char *)(v6 + 10) = self->_flags;
    uint64_t v17 = [(NSString *)self->_originatingBundleID copyWithZone:a3];
    v18 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v17;

    uint64_t v19 = [(NSURL *)self->_originatingWebsiteURL copyWithZone:a3];
    char v20 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = v19;

    *(void *)(v6 + 80) = self->_predictionAge;
    *(unsigned char *)(v6 + 9) = self->_shouldAggregate;
  }
  return (id)v6;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"lab"];
  [v5 encodeObject:self->_value forKey:@"val"];
  [v5 encodeObject:self->_name forKey:@"nam"];
  [v5 encodeObject:self->_date forKey:@"dat"];
  [v5 encodeInt32:self->_fields forKey:@"fld"];
  [v5 encodeObject:self->_originatingBundleID forKey:@"obi"];
  [v5 encodeObject:self->_originatingWebsiteURL forKey:@"owu"];
  [v5 encodeInteger:self->_predictionAge forKey:@"pag"];
  [v5 encodeBool:self->_shouldAggregate forKey:@"sag"];
  [v5 encodeInt32:self->_flags forKey:@"flg"];
  [v5 encodeDouble:@"scr" forKey:self->_score];
  [v5 encodeInt32:self->_source forKey:@"src"];
  [v5 encodeObject:self->_sourceIdentifier forKey:@"sid"];
}

- (PPQuickTypeItem)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"lab"];
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:@"val"];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    char v10 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v4;
      _os_log_error_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_ERROR, "failed to decode label or value from %@", buf, 0xCu);
    }

    uint64_t v19 = 0;
  }
  else
  {
    char v25 = [v4 decodeObjectOfClass:v5 forKey:@"nam"];
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dat"];
    unsigned int v23 = [v4 decodeInt32ForKey:@"fld"];
    v22 = [v4 decodeObjectOfClass:v5 forKey:@"obi"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owu"];
    uint64_t v12 = [v4 decodeIntegerForKey:@"pag"];
    char v13 = [v4 decodeBoolForKey:@"sag"];
    char v14 = [v4 decodeInt32ForKey:@"flg"];
    [v4 decodeDoubleForKey:@"scr"];
    double v16 = v15;
    char v17 = [v4 decodeInt32ForKey:@"src"];
    v18 = [v4 decodeObjectOfClass:v5 forKey:@"sid"];
    BYTE2(v21) = v17;
    BYTE1(v21) = v14;
    LOBYTE(v21) = v13;
    self = -[PPQuickTypeItem initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:](self, "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v6, v8, v25, v24, v23, v22, v16, v11, v12, v21, v18);

    uint64_t v19 = self;
  }

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_source - (unint64_t)self->_score + 32 * (unint64_t)self->_score;
  NSUInteger v4 = [(NSString *)self->_sourceIdentifier hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_label hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_value hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_name hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSDate *)self->_date hash];
  uint64_t v9 = self->_fields - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  uint64_t v10 = self->_flags - v9 + 32 * v9;
  NSUInteger v11 = [(NSString *)self->_originatingBundleID hash] - v10 + 32 * v10;
  uint64_t v12 = [(NSURL *)self->_originatingWebsiteURL hash];
  unint64_t v13 = self->_predictionAge - (v12 - v11 + 32 * v11) + 32 * (v12 - v11 + 32 * v11);
  return self->_shouldAggregate - v13 + 32 * v13;
}

- (id)description
{
  id v3 = [NSString alloc];
  value = self->_value;
  name = self->_name;
  label = self->_label;
  uint64_t fields = self->_fields;
  uint64_t flags = self->_flags;
  [(PPQuickTypeItem *)self score];
  uint64_t v10 = (void *)[v3 initWithFormat:@"<PPQuickTypeItem '%@' %@=%@ (f=%lu) (fl=%lu) (s=%f) (src=%lu)>", name, label, value, fields, flags, v9, -[PPQuickTypeItem source](self, "source")];
  return v10;
}

- (PPQuickTypeItem)initWithLabel:(id)a3 value:(id)a4 name:(id)a5 date:(id)a6 fields:(unsigned int)a7 originatingBundleID:(id)a8 originatingWebsiteURL:(id)a9 predictionAge:(unint64_t)a10 shouldAggregate:(BOOL)a11 flags:(unsigned __int8)a12 score:(double)a13 source:(unsigned __int8)a14 sourceIdentifier:(id)a15
{
  id v22 = a3;
  id v23 = a4;
  id obj = a5;
  id v24 = a5;
  id v31 = a6;
  id v34 = a6;
  id v25 = a8;
  id v26 = a9;
  id v33 = a15;
  v35.receiver = self;
  v35.super_class = (Class)PPQuickTypeItem;
  id v27 = [(PPQuickTypeItem *)&v35 init];
  uint64_t v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_label, a3);
    objc_storeStrong((id *)&v28->_value, a4);
    objc_storeStrong((id *)&v28->_name, obj);
    objc_storeStrong((id *)&v28->_date, v31);
    v28->_uint64_t fields = a7;
    objc_storeStrong((id *)&v28->_originatingBundleID, a8);
    objc_storeStrong((id *)&v28->_originatingWebsiteURL, a9);
    v28->_predictionAge = a10;
    v28->_shouldAggregate = a11;
    v28->_uint64_t flags = a12;
    v28->_double score = a13;
    v28->_source = a14;
    objc_storeStrong((id *)&v28->_sourceIdentifier, a15);
  }

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)quickTypeItemWithLabel:(id)a3 value:(id)a4 name:(id)a5 date:(id)a6 fields:(unsigned int)a7 originatingBundleID:(id)a8 originatingWebsiteURL:(id)a9 predictionAge:(unint64_t)a10 shouldAggregate:(BOOL)a11 flags:(unsigned __int8)a12 score:(double)a13 source:(unsigned __int8)a14 sourceIdentifier:(id)a15
{
  id v21 = a15;
  id v22 = a9;
  id v23 = a8;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  BYTE2(v30) = a14;
  LOWORD(v30) = __PAIR16__(a12, a11);
  uint64_t v28 = -[PPQuickTypeItem initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:]([PPQuickTypeItem alloc], "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v27, v26, v25, v24, a7, v23, a13, v22, a10, v30, v21);

  return v28;
}

@end