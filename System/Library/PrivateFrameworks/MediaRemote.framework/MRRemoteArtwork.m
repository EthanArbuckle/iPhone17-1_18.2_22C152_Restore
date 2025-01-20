@interface MRRemoteArtwork
+ (BOOL)supportsSecureCoding;
- (MRRemoteArtwork)initWithArtworkURLString:(id)a3 templateData:(id)a4;
- (MRRemoteArtwork)initWithCoder:(id)a3;
- (MRRemoteArtwork)initWithProtobuf:(id)a3;
- (MRRemoteArtwork)initWithProtobufData:(id)a3;
- (NSData)artworkURLTemplateData;
- (NSString)artworkURLString;
- (id)description;
- (id)protobufData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRRemoteArtwork

- (MRRemoteArtwork)initWithArtworkURLString:(id)a3 templateData:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (!(v7 | v8))
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MRRemoteArtwork.m", 15, @"Invalid parameter not satisfying: %@", @"artworkURLString != nil || templateData != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)MRRemoteArtwork;
  v9 = [(MRRemoteArtwork *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [(id)v7 copy];
    artworkURLString = v9->_artworkURLString;
    v9->_artworkURLString = (NSString *)v10;

    uint64_t v12 = [(id)v8 copy];
    artworkURLTemplateData = v9->_artworkURLTemplateData;
    v9->_artworkURLTemplateData = (NSData *)v12;
  }
  return v9;
}

- (MRRemoteArtwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRRemoteArtwork;
  v5 = [(MRRemoteArtwork *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkURLString"];
    artworkURLString = v5->_artworkURLString;
    v5->_artworkURLString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkURLTemplateData"];
    artworkURLTemplateData = v5->_artworkURLTemplateData;
    v5->_artworkURLTemplateData = (NSData *)v8;
  }
  return v5;
}

- (MRRemoteArtwork)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [v4 artworkURLString];
  if (v5)
  {

LABEL_4:
    unint64_t v7 = [v4 artworkURLString];
    uint64_t v8 = [v4 artworkURLTemplateData];
    v9 = [(MRRemoteArtwork *)self initWithArtworkURLString:v7 templateData:v8];

    self = v9;
    uint64_t v6 = self;
    goto LABEL_5;
  }
  uint64_t v6 = [v4 artworkURLTemplateData];

  if (v6) {
    goto LABEL_4;
  }
LABEL_5:

  return v6;
}

- (MRRemoteArtwork)initWithProtobufData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRRemoteArtworkProtobuf alloc] initWithData:v4];

    self = [(MRRemoteArtwork *)self initWithProtobuf:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)protobufData
{
  v3 = objc_alloc_init(_MRRemoteArtworkProtobuf);
  id v4 = [(MRRemoteArtwork *)self artworkURLString];
  [(_MRRemoteArtworkProtobuf *)v3 setArtworkURLString:v4];

  v5 = [(MRRemoteArtwork *)self artworkURLTemplateData];
  [(_MRRemoteArtworkProtobuf *)v3 setArtworkURLTemplateData:v5];

  uint64_t v6 = [(_MRRemoteArtworkProtobuf *)v3 data];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MRRemoteArtwork *)self artworkURLString];
  [v4 encodeObject:v5 forKey:@"artworkURLString"];

  id v6 = [(MRRemoteArtwork *)self artworkURLTemplateData];
  [v4 encodeObject:v6 forKey:@"artworkURLTemplateData"];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRRemoteArtwork *)self artworkURLString];
  id v6 = [(MRRemoteArtwork *)self artworkURLTemplateData];
  unint64_t v7 = (void *)[v3 initWithFormat:@"<%@: url=%@, templates=%@", v4, v5, v6];

  return v7;
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (NSData)artworkURLTemplateData
{
  return self->_artworkURLTemplateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURLTemplateData, 0);

  objc_storeStrong((id *)&self->_artworkURLString, 0);
}

@end