@interface ICTTMergeableWallClockValue
+ (BOOL)canParseData:(id)a3;
+ (id)extractContentsFromBoxedValue:(const void *)a3;
- (ICTTMergeableWallClockValue)initWithArchive:(const void *)a3;
- (ICTTMergeableWallClockValue)initWithData:(id)a3;
- (ICTTMergeableWallClockValue)initWithValue:(id)a3 timestamp:(id)a4;
- (NSDate)timestamp;
- (NSObject)value;
- (id)description;
- (id)serialize;
- (unint64_t)merge:(id)a3;
- (void)saveToArchive:(void *)a3;
- (void)setTimestamp:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ICTTMergeableWallClockValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (ICTTMergeableWallClockValue)initWithData:(id)a3
{
  id v4 = a3;
  topotext::WallClockMergeableValue::WallClockMergeableValue((topotext::WallClockMergeableValue *)v11);
  id v5 = v4;
  v6 = (char *)[v5 bytes];
  int v7 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v5 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = [(ICTTMergeableWallClockValue *)self initWithArchive:v11];
    v8 = self;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICTTMergeableWallClockValue initWithData:](v9);
    }

    v8 = 0;
  }
  topotext::WallClockMergeableValue::~WallClockMergeableValue((topotext::WallClockMergeableValue *)v11);

  return v8;
}

- (ICTTMergeableWallClockValue)initWithArchive:(const void *)a3
{
  if ((~*((_DWORD *)a3 + 8) & 3) != 0)
  {
    v10 = 0;
  }
  else
  {
    id v5 = (topotext::WallClockMergeableValue *)objc_opt_class();
    v6 = v5;
    uint64_t v7 = *((void *)a3 + 6);
    if (!v7) {
      uint64_t v7 = *(void *)(topotext::WallClockMergeableValue::default_instance(v5) + 48);
    }
    v8 = [(topotext::WallClockMergeableValue *)v6 extractContentsFromBoxedValue:v7];
    v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)a3 + 5)];
    self = [(ICTTMergeableWallClockValue *)self initWithValue:v8 timestamp:v9];

    v10 = self;
  }

  return v10;
}

- (ICTTMergeableWallClockValue)initWithValue:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICTTMergeableWallClockValue;
  v8 = [(ICTTMergeableWallClockValue *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    value = v8->_value;
    v8->_value = v9;

    if (v7)
    {
      v11 = (NSDate *)v7;
    }
    else
    {
      v11 = [MEMORY[0x1E4F1C9C8] now];
    }
    timestamp = v8->_timestamp;
    v8->_timestamp = v11;
  }
  return v8;
}

- (void)setValue:(id)a3
{
  id v12 = a3;
  id v4 = [(ICTTMergeableWallClockValue *)self value];
  char v5 = [v4 isEqual:v12];

  if ((v5 & 1) == 0)
  {
    id v6 = NSStringFromSelector(sel_value);
    [(ICTTMergeableWallClockValue *)self willChangeValueForKey:v6];

    id v7 = [v12 copyWithZone:0];
    value = self->_value;
    self->_value = v7;

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    timestamp = self->_timestamp;
    self->_timestamp = v9;

    v11 = NSStringFromSelector(sel_value);
    [(ICTTMergeableWallClockValue *)self didChangeValueForKey:v11];
  }
}

- (unint64_t)merge:(id)a3
{
  id v4 = a3;
  char v5 = [(ICTTMergeableWallClockValue *)self timestamp];
  id v6 = [v4 timestamp];
  uint64_t v7 = [v5 compare:v6];

  if (v7 == -1)
  {
    uint64_t v9 = [v4 value];
    [(ICTTMergeableWallClockValue *)self setValue:v9];

    v10 = [v4 timestamp];
    [(ICTTMergeableWallClockValue *)self setTimestamp:v10];

    unint64_t v8 = 2;
  }
  else
  {
    unint64_t v8 = 1;
  }

  return v8;
}

+ (id)extractContentsFromBoxedValue:(const void *)a3
{
  v3 = 0;
  switch(*((_DWORD *)a3 + 12))
  {
    case 1:
      uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*((void *)a3 + 5)];
      goto LABEL_36;
    case 3:
      uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:*((double *)a3 + 5)];
      goto LABEL_36;
    case 4:
      id v6 = (uint64_t *)*((void *)a3 + 5);
      if (*((char *)v6 + 23) < 0) {
        id v6 = (uint64_t *)*v6;
      }
      uint64_t v5 = [NSString stringWithUTF8String:v6];
      goto LABEL_36;
    case 5:
      id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      int v8 = *((_DWORD *)a3 + 12);
      if (v8 == 5)
      {
        uint64_t v9 = *((void *)a3 + 5);
      }
      else
      {
        uint64_t v9 = google::protobuf::internal::empty_string_;
        if (!google::protobuf::internal::empty_string_) {
          versioned_document::Version::SharedCtor();
        }
      }
      if (*(char *)(v9 + 23) < 0) {
        uint64_t v9 = *(void *)v9;
      }
      if (v8 == 5)
      {
        uint64_t v20 = *((void *)a3 + 5);
      }
      else
      {
        uint64_t v20 = google::protobuf::internal::empty_string_;
        if (!google::protobuf::internal::empty_string_) {
          versioned_document::Version::SharedCtor();
        }
      }
      if (*(char *)(v20 + 23) < 0) {
        uint64_t v21 = *(void *)(v20 + 8);
      }
      else {
        uint64_t v21 = *(unsigned __int8 *)(v20 + 23);
      }
      uint64_t v5 = [v7 initWithBytes:v9 length:v21];
      goto LABEL_36;
    case 6:
      id v10 = objc_alloc(MEMORY[0x1E4F29128]);
      if (*((_DWORD *)a3 + 12) == 6)
      {
        uint64_t v11 = *((void *)a3 + 5);
      }
      else
      {
        uint64_t v11 = google::protobuf::internal::empty_string_;
        if (!google::protobuf::internal::empty_string_) {
          versioned_document::Version::SharedCtor();
        }
      }
      if (*(char *)(v11 + 23) < 0) {
        uint64_t v11 = *(void *)v11;
      }
      uint64_t v5 = [v10 initWithUUIDBytes:v11];
LABEL_36:
      v3 = (void *)v5;
      break;
    case 7:
      id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v13 = topotext::BoxedValue::jsonvalue((topotext::BoxedValue *)a3);
      if (*(char *)(v13 + 23) >= 0) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = *(void *)v13;
      }
      uint64_t v15 = topotext::BoxedValue::jsonvalue((topotext::BoxedValue *)a3);
      if (*(char *)(v15 + 23) >= 0) {
        uint64_t v16 = *(unsigned __int8 *)(v15 + 23);
      }
      else {
        uint64_t v16 = *(void *)(v15 + 8);
      }
      v17 = (void *)[v12 initWithBytes:v14 length:v16];
      id v23 = 0;
      v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v17 options:0 error:&v23];
      id v18 = v23;
      if (v18)
      {
        v19 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[ICTTMergeableWallClockValue extractContentsFromBoxedValue:].cold.4((uint64_t)v18, v19);
        }
      }
      break;
    default:
      break;
  }
  return v3;
}

- (id)serialize
{
  -[ICTTMergeableWallClockValue saveToArchive:](self, "saveToArchive:", v6, topotext::WallClockMergeableValue::WallClockMergeableValue((topotext::WallClockMergeableValue *)v6));
  id v2 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::WallClockMergeableValue::ByteSize((topotext::WallClockMergeableValue *)v6)];
  v3 = (void *)[v2 mutableBytes];
  int v4 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v2 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v6, v3, v4);
  topotext::WallClockMergeableValue::~WallClockMergeableValue((topotext::WallClockMergeableValue *)v6);
  return v2;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  *((_DWORD *)a3 + 8) |= 2u;
  uint64_t v5 = *((void *)a3 + 6);
  if (!v5) {
    operator new();
  }
  id v6 = [(ICTTMergeableWallClockValue *)self value];

  if (v6)
  {
    id v7 = [(ICTTMergeableWallClockValue *)self value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    CFNumberRef v9 = [(ICTTMergeableWallClockValue *)self value];
    CFNumberRef v10 = v9;
    if (isKindOfClass)
    {
      if (CFNumberIsFloatType(v9))
      {
        [(__CFNumber *)v10 doubleValue];
        uint64_t v12 = v11;
        if (*(_DWORD *)(v5 + 48) != 3)
        {
          topotext::BoxedValue::clear_contents(v5);
          *(_DWORD *)(v5 + 48) = 3;
        }
        *(void *)(v5 + 40) = v12;
      }
      else
      {
        uint64_t v20 = [(__CFNumber *)v10 integerValue];
        if (*(_DWORD *)(v5 + 48) != 1)
        {
          topotext::BoxedValue::clear_contents(v5);
          *(_DWORD *)(v5 + 48) = 1;
        }
        *(void *)(v5 + 40) = v20;
      }

      goto LABEL_41;
    }
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    uint64_t v14 = [(ICTTMergeableWallClockValue *)self value];
    uint64_t v15 = v14;
    if (v13)
    {
      id v16 = v14;
      std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v16 UTF8String]);
      if (*(_DWORD *)(v5 + 48) != 4)
      {
        topotext::BoxedValue::clear_contents(v5);
        *(_DWORD *)(v5 + 48) = 4;
        operator new();
      }
      std::string::operator=(*(std::string **)(v5 + 40), &__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
LABEL_22:

      goto LABEL_41;
    }
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    id v18 = [(ICTTMergeableWallClockValue *)self value];
    v19 = v18;
    if (v17)
    {
      id v16 = v18;
      std::string::basic_string[abi:ne180100](&__str, (void *)[v16 bytes], objc_msgSend(v16, "length"));
      if (*(_DWORD *)(v5 + 48) != 5)
      {
        topotext::BoxedValue::clear_contents(v5);
        *(_DWORD *)(v5 + 48) = 5;
        operator new();
      }
      std::string::operator=(*(std::string **)(v5 + 40), &__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_22;
    }
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    if (v21)
    {
      v22 = [(ICTTMergeableWallClockValue *)self value];
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = 0uLL;
      [v22 getUUIDBytes:&__str];
      if (*(_DWORD *)(v5 + 48) != 6)
      {
        topotext::BoxedValue::clear_contents(v5);
        *(_DWORD *)(v5 + 48) = 6;
        operator new();
      }
      MEMORY[0x1C877D5C0](*(void *)(v5 + 40), &__str, 16);
    }
    else
    {
      id v23 = (void *)MEMORY[0x1E4F28D90];
      v24 = [(ICTTMergeableWallClockValue *)self value];
      LODWORD(v23) = [v23 isValidJSONObject:v24];

      if (v23)
      {
        v25 = (void *)MEMORY[0x1E4F28D90];
        v26 = [(ICTTMergeableWallClockValue *)self value];
        id v38 = 0;
        v27 = [v25 dataWithJSONObject:v26 options:0 error:&v38];
        id v28 = v38;

        if (!v27 || v28)
        {
          v32 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v35 = [(ICTTMergeableWallClockValue *)self value];
            v36 = objc_opt_class();
            LODWORD(__str.__r_.__value_.__l.__data_) = 138412546;
            *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = (std::string::size_type)v36;
            WORD2(__str.__r_.__value_.__r.__words[1]) = 2112;
            *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v28;
            id v37 = v36;
            _os_log_error_impl(&dword_1C3A61000, v32, OS_LOG_TYPE_ERROR, "Error converting ICTTMergeableWallClockValue: %@ to JSON: %@", (uint8_t *)&__str, 0x16u);
          }
        }
        else
        {
          id v29 = v27;
          std::string::basic_string[abi:ne180100](&__str, (void *)[v29 bytes], objc_msgSend(v29, "length"));
          topotext::BoxedValue::set_jsonvalue((topotext::BoxedValue *)v5, &__str);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
        }
      }
      else
      {
        v30 = (void *)MEMORY[0x1E4F836F8];
        v31 = [(ICTTMergeableWallClockValue *)self value];
        [v30 handleFailedAssertWithCondition:"__objc_no", "-[ICTTMergeableWallClockValue saveToArchive:]", 1, 0, @"Unsupported contents type for boxing in ICTTMergeableWallClockValue: %@", objc_opt_class() functionName simulateCrash showAlert format];
      }
    }
  }
LABEL_41:
  v33 = [(ICTTMergeableWallClockValue *)self timestamp];
  [v33 timeIntervalSinceReferenceDate];
  *((_DWORD *)a3 + 8) |= 1u;
  *((void *)a3 + 5) = v34;
}

+ (BOOL)canParseData:(id)a3
{
  id v3 = a3;
  topotext::WallClockMergeableValue::WallClockMergeableValue((topotext::WallClockMergeableValue *)v8);
  id v4 = v3;
  uint64_t v5 = (char *)[v4 bytes];
  int v6 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v4 length]);
  LOBYTE(v5) = google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v8, v5, v6);
  topotext::WallClockMergeableValue::~WallClockMergeableValue((topotext::WallClockMergeableValue *)v8);

  return (char)v5;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(ICTTMergeableWallClockValue *)self timestamp];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;
  int v8 = [(ICTTMergeableWallClockValue *)self value];
  CFNumberRef v9 = [v3 stringWithFormat:@"<%@: %p, timestamp: %f, value: %@>", v4, self, v7, v8];

  return v9;
}

- (NSObject)value
{
  return self->_value;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Corrupt protobuf data for initializing ICTTMergeableWallClockValue", v1, 2u);
}

+ (void)extractContentsFromBoxedValue:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error parsing JSON for ICTTMergeableWallClockValue: %@", (uint8_t *)&v2, 0xCu);
}

@end