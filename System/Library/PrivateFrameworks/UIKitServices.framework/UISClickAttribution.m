@interface UISClickAttribution
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventAuthenticationMessage)eventMessage;
- (BOOL)isEqual:(id)a3;
- (NSString)purchaser;
- (NSString)sourceDescription;
- (NSURL)destinationURL;
- (NSURL)reportEndpoint;
- (UISClickAttribution)clickAttributionWithReportEndpoint:(id)a3;
- (UISClickAttribution)initWithCoder:(id)a3;
- (UISClickAttribution)initWithSourceIdentifier:(unsigned __int8)a3 destinationURL:(id)a4 reportEndpoint:(id)a5 sourceDescription:(id)a6 purchaser:(id)a7 eventMessage:(id)a8;
- (unint64_t)hash;
- (unsigned)sourceIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UISClickAttribution

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISClickAttribution)initWithSourceIdentifier:(unsigned __int8)a3 destinationURL:(id)a4 reportEndpoint:(id)a5 sourceDescription:(id)a6 purchaser:(id)a7 eventMessage:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)UISClickAttribution;
  v19 = [(UISClickAttribution *)&v32 init];
  v20 = v19;
  if (v19)
  {
    v19->_sourceIdentifier = a3;
    uint64_t v21 = [v14 copy];
    destinationURL = v20->_destinationURL;
    v20->_destinationURL = (NSURL *)v21;

    uint64_t v23 = [v15 copy];
    reportEndpoint = v20->_reportEndpoint;
    v20->_reportEndpoint = (NSURL *)v23;

    if ((unint64_t)[v16 length] > 0x64)
    {
      uint64_t v25 = [v16 substringToIndex:100];
    }
    else
    {
      uint64_t v25 = [v16 copy];
    }
    sourceDescription = v20->_sourceDescription;
    v20->_sourceDescription = (NSString *)v25;

    if ((unint64_t)[v17 length] > 0x64)
    {
      uint64_t v27 = [v17 substringToIndex:100];
    }
    else
    {
      uint64_t v27 = [v17 copy];
    }
    purchaser = v20->_purchaser;
    v20->_purchaser = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    eventMessage = v20->_eventMessage;
    v20->_eventMessage = (BKSHIDEventAuthenticationMessage *)v29;
  }
  return v20;
}

- (UISClickAttribution)clickAttributionWithReportEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [UISClickAttribution alloc];
  uint64_t v6 = [(UISClickAttribution *)self sourceIdentifier];
  v7 = [(UISClickAttribution *)self destinationURL];
  v8 = [(UISClickAttribution *)self sourceDescription];
  v9 = [(UISClickAttribution *)self purchaser];
  v10 = [(UISClickAttribution *)self eventMessage];
  v11 = [(UISClickAttribution *)v5 initWithSourceIdentifier:v6 destinationURL:v7 reportEndpoint:v4 sourceDescription:v8 purchaser:v9 eventMessage:v10];

  return v11;
}

- (UISClickAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UISClickAttribution;
  v5 = [(UISClickAttribution *)&v22 init];
  if (v5)
  {
    v5->_sourceIdentifier = [v4 decodeIntegerForKey:@"SourceIdentifier"];
    uint64_t v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"DestinationURL"];
    destinationURL = v5->_destinationURL;
    v5->_destinationURL = (NSURL *)v7;

    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"ReportEndpoint"];
    reportEndpoint = v5->_reportEndpoint;
    v5->_reportEndpoint = (NSURL *)v10;

    v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"SourceDescription"];
    sourceDescription = v5->_sourceDescription;
    v5->_sourceDescription = (NSString *)v13;

    id v15 = self;
    uint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"Purchaser"];
    purchaser = v5->_purchaser;
    v5->_purchaser = (NSString *)v16;

    id v18 = self;
    uint64_t v19 = [v4 decodeObjectOfClass:v18 forKey:@"EventMessage"];
    eventMessage = v5->_eventMessage;
    v5->_eventMessage = (BKSHIDEventAuthenticationMessage *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sourceIdentifier = self->_sourceIdentifier;
  id v5 = a3;
  [v5 encodeInteger:sourceIdentifier forKey:@"SourceIdentifier"];
  [v5 encodeObject:self->_destinationURL forKey:@"DestinationURL"];
  [v5 encodeObject:self->_reportEndpoint forKey:@"ReportEndpoint"];
  [v5 encodeObject:self->_sourceDescription forKey:@"SourceDescription"];
  [v5 encodeObject:self->_purchaser forKey:@"Purchaser"];
  [v5 encodeObject:self->_eventMessage forKey:@"EventMessage"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UISClickAttribution *)a3;
  if (self == v4)
  {
    unsigned __int8 v19 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = v4;
      int sourceIdentifier = self->_sourceIdentifier;
      if (sourceIdentifier == [(UISClickAttribution *)v7 sourceIdentifier])
      {
        destinationURL = self->_destinationURL;
        uint64_t v10 = [(UISClickAttribution *)v7 destinationURL];
        if (destinationURL == v10 || [(NSURL *)destinationURL isEqual:v10])
        {
          reportEndpoint = self->_reportEndpoint;
          v12 = [(UISClickAttribution *)v7 reportEndpoint];
          if (reportEndpoint == v12 || [(NSURL *)reportEndpoint isEqual:v12])
          {
            sourceDescription = self->_sourceDescription;
            id v14 = [(UISClickAttribution *)v7 sourceDescription];
            if (sourceDescription == v14 || [(NSString *)sourceDescription isEqual:v14])
            {
              purchaser = self->_purchaser;
              uint64_t v16 = [(UISClickAttribution *)v7 purchaser];
              if (purchaser == v16 || [(NSString *)purchaser isEqual:v16])
              {
                eventMessage = self->_eventMessage;
                id v18 = [(UISClickAttribution *)v7 eventMessage];
                if (eventMessage == v18) {
                  unsigned __int8 v19 = 1;
                }
                else {
                  unsigned __int8 v19 = [(BKSHIDEventAuthenticationMessage *)eventMessage isEqual:v18];
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
      v21.receiver = self;
      v21.super_class = (Class)UISClickAttribution;
      unsigned __int8 v19 = [(UISClickAttribution *)&v21 isEqual:v4];
    }
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t sourceIdentifier = self->_sourceIdentifier;
  uint64_t v4 = [(NSURL *)self->_destinationURL hash] ^ sourceIdentifier;
  uint64_t v5 = [(NSURL *)self->_reportEndpoint hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_sourceDescription hash];
  NSUInteger v7 = [(NSString *)self->_purchaser hash];
  return v6 ^ v7 ^ [(BKSHIDEventAuthenticationMessage *)self->_eventMessage hash];
}

- (unsigned)sourceIdentifier
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

- (BKSHIDEventAuthenticationMessage)eventMessage
{
  return self->_eventMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMessage, 0);
  objc_storeStrong((id *)&self->_purchaser, 0);
  objc_storeStrong((id *)&self->_sourceDescription, 0);
  objc_storeStrong((id *)&self->_reportEndpoint, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end