@interface PLEditSource
- (BOOL)isRAWSource;
- (NUSource)resolvedSource;
- (NUSource)source;
- (PLEditSource)initWithResolvedSource:(id)a3 mediaType:(int64_t)a4;
- (id)description;
- (int64_t)mediaType;
- (void)setIdentifier:(id)a3;
- (void)setResolvedSource:(id)a3 mediaType:(int64_t)a4;
@end

@implementation PLEditSource

- (void).cxx_destruct
{
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NUSource)resolvedSource
{
  return self->_resolvedSource;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> %@", objc_opt_class(), self, self->_resolvedSource];
}

- (BOOL)isRAWSource
{
  return 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PLEditSource *)self resolvedSource];
  [v5 setAssetIdentifier:v4];
}

- (NUSource)source
{
  return self->_resolvedSource;
}

- (void)setResolvedSource:(id)a3 mediaType:(int64_t)a4
{
  v7 = (NUSource *)a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLEditSource.m", 44, @"Invalid parameter not satisfying: %@", @"resolvedSource != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"PLEditSource.m", 45, @"Invalid parameter not satisfying: %@", @"mediaType != NUMediaTypeUnknown" object file lineNumber description];

LABEL_3:
  resolvedSource = self->_resolvedSource;
  self->_resolvedSource = v7;
  self->_mediaType = a4;
}

- (PLEditSource)initWithResolvedSource:(id)a3 mediaType:(int64_t)a4
{
  v7 = (NUSource *)a3;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLEditSource.m", 31, @"Invalid parameter not satisfying: %@", @"source != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLEditSource.m", 32, @"Invalid parameter not satisfying: %@", @"mediaType != NUMediaTypeUnknown" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v13.receiver = self;
  v13.super_class = (Class)PLEditSource;
  v8 = [(PLEditSource *)&v13 init];
  resolvedSource = v8->_resolvedSource;
  v8->_resolvedSource = v7;
  v8->_mediaType = a4;

  return v8;
}

@end