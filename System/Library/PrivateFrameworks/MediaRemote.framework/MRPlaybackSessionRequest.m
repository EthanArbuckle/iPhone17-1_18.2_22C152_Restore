@interface MRPlaybackSessionRequest
- (BOOL)hasLength;
- (BOOL)hasLocation;
- (BOOL)isEqual:(id)a3;
- (MRPlaybackSessionRequest)initWithData:(id)a3;
- (MRPlaybackSessionRequest)initWithIdentifier:(id)a3 range:(_NSRange)a4;
- (MRPlaybackSessionRequest)initWithIdentifier:(id)a3 type:(id)a4;
- (MRPlaybackSessionRequest)initWithProtobuf:(id)a3;
- (NSData)data;
- (NSString)identifier;
- (NSString)requestIdentifier;
- (NSString)type;
- (_MRPlaybackSessionRequestProtobuf)protobuf;
- (_NSRange)range;
- (id)description;
- (unint64_t)length;
- (unint64_t)location;
- (void)setHasLength:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLength:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MRPlaybackSessionRequest

- (MRPlaybackSessionRequest)initWithIdentifier:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRPlaybackSessionRequest;
  v8 = [(MRPlaybackSessionRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    type = v8->_type;
    v8->_type = (NSString *)v11;
  }
  return v8;
}

- (MRPlaybackSessionRequest)initWithIdentifier:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRPlaybackSessionRequest;
  v8 = [(MRPlaybackSessionRequest *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_NSUInteger location = location;
    v8->_NSUInteger length = length;
    *(_WORD *)&v8->_hasLocation = 257;
  }

  return v8;
}

- (MRPlaybackSessionRequest)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)MRPlaybackSessionRequest;
    v5 = [(MRPlaybackSessionRequest *)&v17 init];
    if (v5)
    {
      id v6 = [v4 requestID];
      uint64_t v7 = [v6 copy];
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSString *)v7;

      uint64_t v9 = [v4 identifier];
      uint64_t v10 = [v9 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;

      objc_super v12 = [v4 type];
      uint64_t v13 = [v12 copy];
      type = v5->_type;
      v5->_type = (NSString *)v13;

      v5->_NSUInteger location = (int)[v4 location];
      v5->_hasLocation = [v4 hasLocation];
      v5->_NSUInteger length = (int)[v4 length];
      v5->_hasLength = [v4 hasLength];
    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (MRPlaybackSessionRequest)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [[_MRPlaybackSessionRequestProtobuf alloc] initWithData:v4];
    id v6 = [(MRPlaybackSessionRequest *)self initWithProtobuf:v5];
  }
  else
  {
    id v6 = [(MRPlaybackSessionRequest *)self initWithProtobuf:0];
  }

  return v6;
}

- (_MRPlaybackSessionRequestProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRPlaybackSessionRequestProtobuf);
  id v4 = [(MRPlaybackSessionRequest *)self requestIdentifier];
  v5 = (void *)[v4 copy];
  [(_MRPlaybackSessionRequestProtobuf *)v3 setRequestID:v5];

  id v6 = [(MRPlaybackSessionRequest *)self identifier];
  uint64_t v7 = (void *)[v6 copy];
  [(_MRPlaybackSessionRequestProtobuf *)v3 setIdentifier:v7];

  v8 = [(MRPlaybackSessionRequest *)self type];
  uint64_t v9 = (void *)[v8 copy];
  [(_MRPlaybackSessionRequestProtobuf *)v3 setType:v9];

  [(_MRPlaybackSessionRequestProtobuf *)v3 setLocation:[(MRPlaybackSessionRequest *)self location]];
  [(_MRPlaybackSessionRequestProtobuf *)v3 setHasLocation:[(MRPlaybackSessionRequest *)self hasLocation]];
  [(_MRPlaybackSessionRequestProtobuf *)v3 setLength:[(MRPlaybackSessionRequest *)self length]];
  [(_MRPlaybackSessionRequestProtobuf *)v3 setHasLength:[(MRPlaybackSessionRequest *)self hasLength]];

  return v3;
}

- (NSData)data
{
  v2 = [(MRPlaybackSessionRequest *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (_NSRange)range
{
  unint64_t v3 = [(MRPlaybackSessionRequest *)self location];
  NSUInteger v4 = [(MRPlaybackSessionRequest *)self length];
  NSUInteger v5 = v3;
  result.NSUInteger length = v4;
  result.NSUInteger location = v5;
  return result;
}

- (void)setLocation:(unint64_t)a3
{
  self->_NSUInteger location = a3;
  self->_hasLocation = 1;
}

- (void)setLength:(unint64_t)a3
{
  self->_NSUInteger length = a3;
  self->_hasLength = 1;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (MRPlaybackSessionRequest *)a3;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      BOOL v6 = [(MRPlaybackSessionRequest *)v5 hasLocation];
      if (v6 != [(MRPlaybackSessionRequest *)self hasLocation]) {
        goto LABEL_19;
      }
      if ([(MRPlaybackSessionRequest *)v5 hasLocation])
      {
        if ([(MRPlaybackSessionRequest *)self hasLocation])
        {
          uint64_t v7 = [(MRPlaybackSessionRequest *)v5 location];
          if (v7 != [(MRPlaybackSessionRequest *)self location]) {
            goto LABEL_19;
          }
        }
      }
      BOOL v8 = [(MRPlaybackSessionRequest *)v5 hasLength];
      if (v8 != [(MRPlaybackSessionRequest *)self hasLength]) {
        goto LABEL_19;
      }
      if ([(MRPlaybackSessionRequest *)v5 hasLength])
      {
        if ([(MRPlaybackSessionRequest *)self hasLength])
        {
          uint64_t v9 = [(MRPlaybackSessionRequest *)v5 length];
          if (v9 != [(MRPlaybackSessionRequest *)self length]) {
            goto LABEL_19;
          }
        }
      }
      uint64_t v10 = [(MRPlaybackSessionRequest *)v5 requestIdentifier];
      uint64_t v11 = [(MRPlaybackSessionRequest *)self requestIdentifier];
      if (v10 == (void *)v11)
      {
      }
      else
      {
        objc_super v12 = (void *)v11;
        uint64_t v13 = [(MRPlaybackSessionRequest *)v5 requestIdentifier];
        objc_super v14 = [(MRPlaybackSessionRequest *)self requestIdentifier];
        int v15 = [v13 isEqualToString:v14];

        if (!v15) {
          goto LABEL_19;
        }
      }
      objc_super v17 = [(MRPlaybackSessionRequest *)v5 identifier];
      uint64_t v18 = [(MRPlaybackSessionRequest *)self identifier];
      if (v17 == (void *)v18)
      {
      }
      else
      {
        v19 = (void *)v18;
        v20 = [(MRPlaybackSessionRequest *)v5 identifier];
        v21 = [(MRPlaybackSessionRequest *)self identifier];
        int v22 = [v20 isEqualToString:v21];

        if (!v22)
        {
LABEL_19:
          char v16 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      v24 = [(MRPlaybackSessionRequest *)v5 type];
      uint64_t v25 = [(MRPlaybackSessionRequest *)self type];
      if (v24 == (void *)v25)
      {
        char v16 = 1;
        v26 = v24;
      }
      else
      {
        v26 = (void *)v25;
        v27 = [(MRPlaybackSessionRequest *)v5 type];
        v28 = [(MRPlaybackSessionRequest *)self type];
        char v16 = [v27 isEqualToString:v28];
      }
      goto LABEL_20;
    }
    char v16 = 0;
  }
LABEL_21:

  return v16;
}

- (id)description
{
  id v3 = [NSString alloc];
  NSUInteger v4 = [(MRPlaybackSessionRequest *)self requestIdentifier];
  NSUInteger v5 = [(MRPlaybackSessionRequest *)self identifier];
  BOOL v6 = [(MRPlaybackSessionRequest *)self type];
  uint64_t v7 = (void *)[v3 initWithFormat:@"%@/%@/%@", v4, v5, v6];

  return v7;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (unint64_t)location
{
  return self->_location;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (BOOL)hasLength
{
  return self->_hasLength;
}

- (void)setHasLength:(BOOL)a3
{
  self->_hasLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end