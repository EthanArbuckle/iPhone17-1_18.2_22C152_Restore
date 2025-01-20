@interface CACTextMarker
+ (BOOL)marker:(id)a3 precedesMarker:(id)a4;
+ (BOOL)marker:(id)a3 precedesOrEqualsMarker:(id)a4;
+ (id)markerWithData:(id)a3;
+ (id)markerWithIndex:(unint64_t)a3;
+ (unint64_t)lengthFromMarker:(id)a3 toMarker:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CACTextMarker)initWithData:(id)a3;
- (CACTextMarker)initWithIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)description;
- (unint64_t)hash;
- (unint64_t)index;
- (void)setData:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation CACTextMarker

+ (id)markerWithIndex:(unint64_t)a3
{
  v3 = (void *)[objc_allocWithZone((Class)CACTextMarker) initWithIndex:a3];
  return v3;
}

+ (id)markerWithData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = (void *)[objc_allocWithZone((Class)CACTextMarker) initWithData:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)marker:(id)a3 precedesOrEqualsMarker:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 index] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "index") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = CACLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CACTextMarker marker:precedesOrEqualsMarker:](v7);
    }

    BOOL v8 = 0;
  }
  else
  {
    unint64_t v9 = [v5 index];
    BOOL v8 = v9 < [v6 index];
  }

  return v8;
}

+ (unint64_t)lengthFromMarker:(id)a3 toMarker:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 index] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "index") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = CACLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CACTextMarker lengthFromMarker:toMarker:](v7);
    }

    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = [v6 index];
    unint64_t v8 = v9 - [v5 index];
  }

  return v8;
}

+ (BOOL)marker:(id)a3 precedesMarker:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [a3 index];
  unint64_t v7 = [v5 index];

  return v6 < v7;
}

- (CACTextMarker)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACTextMarker;
  unint64_t v6 = [(CACTextMarker *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    v6->_index = 0;
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (CACTextMarker)initWithIndex:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CACTextMarker;
  v4 = [(CACTextMarker *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    data = v4->_data;
    v4->_index = a3;
    v4->_data = 0;
  }
  return v5;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  id v5 = (NSData *)a3;
  data = self->_data;
  p_data = &self->_data;
  if (data != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_data, a3);
    id v5 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  data = self->_data;
  id v5 = +[CACTextMarker allocWithZone:a3];
  if (data)
  {
    unint64_t v6 = self->_data;
    return [(CACTextMarker *)v5 initWithData:v6];
  }
  else
  {
    unint64_t index = self->_index;
    return [(CACTextMarker *)v5 initWithIndex:index];
  }
}

- (unint64_t)hash
{
  data = self->_data;
  if (data) {
    return CFHash(data);
  }
  else {
    return self->_index;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CACTextMarker *)self data];
    uint64_t v6 = [v4 data];
    unint64_t v7 = (void *)v6;
    if (v5 | v6)
    {
      BOOL v8 = 0;
      if (v5 && v6) {
        BOOL v8 = CFEqual((CFTypeRef)v5, (CFTypeRef)v6) != 0;
      }
    }
    else
    {
      unint64_t v9 = [(CACTextMarker *)self index];
      BOOL v8 = v9 == [v4 index];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = [(CACTextMarker *)self data];

  if (v3) {
    [NSString stringWithFormat:@"TextMarker (data): %@", self->_data];
  }
  else {
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"TextMarker: %ld", self->_index);
  }
  return v4;
}

- (void).cxx_destruct
{
}

+ (void)marker:(os_log_t)log precedesOrEqualsMarker:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "asked if marker precedesOrEqualsMarker with invalid marker index", v1, 2u);
}

+ (void)lengthFromMarker:(os_log_t)log toMarker:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "asked for range between 2 markers with invalid marker index", v1, 2u);
}

@end