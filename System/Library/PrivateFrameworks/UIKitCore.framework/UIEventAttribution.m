@interface UIEventAttribution
- (BOOL)isEqual:(id)a3;
- (NSString)purchaser;
- (NSString)sourceDescription;
- (NSURL)destinationURL;
- (NSURL)reportEndpoint;
- (UIEventAttribution)initWithSourceIdentifier:(uint8_t)sourceIdentifier destinationURL:(NSURL *)destinationURL sourceDescription:(NSString *)sourceDescription purchaser:(NSString *)purchaser;
- (UIEventAttribution)initWithSourceIdentifier:(unsigned __int8)a3 destinationURL:(id)a4 reportEndpoint:(id)a5 sourceDescription:(id)a6 purchaser:(id)a7;
- (UIEventAttribution)initWithUISClickAttribution:(id)a3;
- (id)toUISClickAttribution;
- (uint8_t)sourceIdentifier;
- (unint64_t)hash;
@end

@implementation UIEventAttribution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaser, 0);
  objc_storeStrong((id *)&self->_sourceDescription, 0);
  objc_storeStrong((id *)&self->_reportEndpoint, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

- (UIEventAttribution)initWithUISClickAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [v4 sourceIdentifier];
    v6 = [v4 destinationURL];
    v7 = [v4 reportEndpoint];
    v8 = [v4 sourceDescription];
    v9 = [v4 purchaser];

    self = [(UIEventAttribution *)self initWithSourceIdentifier:v5 destinationURL:v6 reportEndpoint:v7 sourceDescription:v8 purchaser:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIEventAttribution)initWithSourceIdentifier:(uint8_t)sourceIdentifier destinationURL:(NSURL *)destinationURL sourceDescription:(NSString *)sourceDescription purchaser:(NSString *)purchaser
{
  uint64_t v8 = sourceIdentifier;
  uint64_t v10 = qword_1EB262148;
  v11 = purchaser;
  v12 = sourceDescription;
  v13 = destinationURL;
  if (v10 != -1) {
    dispatch_once(&qword_1EB262148, &__block_literal_global_413);
  }
  v14 = [(UIEventAttribution *)self initWithSourceIdentifier:v8 destinationURL:v13 reportEndpoint:_MergedGlobals_1179 sourceDescription:v12 purchaser:v11];

  return v14;
}

- (UIEventAttribution)initWithSourceIdentifier:(unsigned __int8)a3 destinationURL:(id)a4 reportEndpoint:(id)a5 sourceDescription:(id)a6 purchaser:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)UIEventAttribution;
  v16 = [(UIEventAttribution *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_sourceIdentifier = a3;
    uint64_t v18 = [v12 copy];
    destinationURL = v17->_destinationURL;
    v17->_destinationURL = (NSURL *)v18;

    uint64_t v20 = [v13 copy];
    reportEndpoint = v17->_reportEndpoint;
    v17->_reportEndpoint = (NSURL *)v20;

    if ((unint64_t)[v14 length] > 0x64)
    {
      uint64_t v22 = [v14 substringToIndex:100];
    }
    else
    {
      uint64_t v22 = [v14 copy];
    }
    sourceDescription = v17->_sourceDescription;
    v17->_sourceDescription = (NSString *)v22;

    if ((unint64_t)[v15 length] > 0x64)
    {
      uint64_t v24 = [v15 substringToIndex:100];
    }
    else
    {
      uint64_t v24 = [v15 copy];
    }
    purchaser = v17->_purchaser;
    v17->_purchaser = (NSString *)v24;
  }
  return v17;
}

- (id)toUISClickAttribution
{
  v3 = +[UIEventAttributionView lastEventMessage];
  id v4 = objc_alloc(MEMORY[0x1E4FB33C8]);
  uint64_t v5 = [(UIEventAttribution *)self sourceIdentifier];
  v6 = [(UIEventAttribution *)self destinationURL];
  v7 = [(UIEventAttribution *)self reportEndpoint];
  uint64_t v8 = [(UIEventAttribution *)self sourceDescription];
  v9 = [(UIEventAttribution *)self purchaser];
  uint64_t v10 = (void *)[v4 initWithSourceIdentifier:v5 destinationURL:v6 reportEndpoint:v7 sourceDescription:v8 purchaser:v9 eventMessage:v3];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIEventAttribution *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      int sourceIdentifier = self->_sourceIdentifier;
      if (sourceIdentifier != [(UIEventAttribution *)v7 sourceIdentifier])
      {
        LOBYTE(v14) = 0;
LABEL_39:

        goto LABEL_40;
      }
      destinationURL = self->_destinationURL;
      uint64_t v10 = [(UIEventAttribution *)v7 destinationURL];
      v11 = destinationURL;
      id v12 = v10;
      id v13 = v12;
      if (v11 == v12)
      {
      }
      else
      {
        LOBYTE(v14) = 0;
        if (!v11 || !v12)
        {
          uint64_t v18 = v12;
LABEL_36:

LABEL_37:
          goto LABEL_38;
        }
        int v15 = [(NSURL *)v11 isEqual:v12];

        if (!v15)
        {
          LOBYTE(v14) = 0;
LABEL_38:

          goto LABEL_39;
        }
      }
      reportEndpoint = self->_reportEndpoint;
      v17 = [(UIEventAttribution *)v7 reportEndpoint];
      uint64_t v18 = reportEndpoint;
      v19 = v17;
      v11 = v19;
      if (v18 == v19)
      {
      }
      else
      {
        LOBYTE(v14) = 0;
        if (!v18 || !v19)
        {
          p_isa = (NSString *)&v19->super.isa;
LABEL_35:

          goto LABEL_36;
        }
        int v14 = [(NSURL *)v18 isEqual:v19];

        if (!v14) {
          goto LABEL_37;
        }
      }
      sourceDescription = self->_sourceDescription;
      v21 = [(UIEventAttribution *)v7 sourceDescription];
      p_isa = sourceDescription;
      v23 = v21;
      uint64_t v18 = v23;
      if (p_isa == (NSString *)v23)
      {
      }
      else
      {
        LOBYTE(v14) = 0;
        if (!p_isa || !v23)
        {
          v26 = (NSString *)&v23->super.isa;
LABEL_34:

          goto LABEL_35;
        }
        int v14 = [(NSString *)p_isa isEqual:v23];

        if (!v14) {
          goto LABEL_36;
        }
      }
      purchaser = self->_purchaser;
      v25 = [(UIEventAttribution *)v7 purchaser];
      v26 = purchaser;
      objc_super v27 = v25;
      p_isa = v27;
      if (v26 == v27)
      {
        LOBYTE(v14) = 1;
      }
      else
      {
        LOBYTE(v14) = 0;
        if (v26 && v27) {
          LOBYTE(v14) = [(NSString *)v26 isEqual:v27];
        }
      }

      goto LABEL_34;
    }
    v29.receiver = self;
    v29.super_class = (Class)UIEventAttribution;
    LOBYTE(v14) = [(UIEventAttribution *)&v29 isEqual:v4];
  }
LABEL_40:

  return v14;
}

- (unint64_t)hash
{
  uint64_t sourceIdentifier = self->_sourceIdentifier;
  uint64_t v4 = [(NSURL *)self->_destinationURL hash] ^ sourceIdentifier;
  uint64_t v5 = [(NSURL *)self->_reportEndpoint hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_sourceDescription hash];
  return v6 ^ [(NSString *)self->_purchaser hash];
}

- (uint8_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (NSURL)reportEndpoint
{
  return self->_reportEndpoint;
}

- (NSString)sourceDescription
{
  return self->_sourceDescription;
}

- (NSString)purchaser
{
  return self->_purchaser;
}

@end