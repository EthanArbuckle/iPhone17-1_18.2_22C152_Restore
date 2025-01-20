@interface WBSCloudHistoryVisit
+ (BOOL)supportsSecureCoding;
- (BOOL)loadWasSuccessful;
- (BOOL)wasHTTPNonGet;
- (NSDictionary)dictionaryRepresentation;
- (NSString)title;
- (WBSCloudHistoryVisit)initWithCoder:(id)a3;
- (WBSCloudHistoryVisit)initWithDictionary:(id)a3;
- (WBSCloudHistoryVisit)initWithHistoryVisit:(id)a3;
- (WBSCloudHistoryVisit)initWithVisitIdentifier:(id)a3 title:(id)a4 loadSuccessful:(BOOL)a5 httpNonGet:(BOOL)a6 redirectSourceVisitIdentifier:(id)a7 redirectDestinationVisitIdentifier:(id)a8;
- (WBSCloudHistoryVisit)redirectDestinationVisit;
- (WBSCloudHistoryVisit)redirectSourceVisit;
- (WBSHistoryVisitIdentifier)redirectDestinationVisitIdentifier;
- (WBSHistoryVisitIdentifier)redirectSourceVisitIdentifier;
- (WBSHistoryVisitIdentifier)visitIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHttpNonGet:(BOOL)a3;
- (void)setLoadSuccessful:(BOOL)a3;
- (void)setRedirectDestinationVisit:(id)a3;
- (void)setRedirectDestinationVisitIdentifier:(id)a3;
- (void)setRedirectSourceVisit:(id)a3;
- (void)setRedirectSourceVisitIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisitIdentifier:(id)a3;
@end

@implementation WBSCloudHistoryVisit

- (WBSCloudHistoryVisit)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WBSCloudHistoryVisit;
  v5 = [(WBSCloudHistoryVisit *)&v29 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "safari_stringForKey:", @"URL");
    if ([v6 length])
    {
      v7 = objc_msgSend(v4, "safari_numberForKey:", @"VisitTime");
      [v7 doubleValue];
      double v9 = v8;

      v10 = [[WBSHistoryVisitIdentifier alloc] initWithURLString:v6 visitTime:v9];
      visitIdentifier = v5->_visitIdentifier;
      v5->_visitIdentifier = v10;

      v12 = objc_msgSend(v4, "safari_stringForKey:", @"Title");
      uint64_t v13 = [v12 copy];
      title = v5->_title;
      v5->_title = (NSString *)v13;

      v5->_loadSuccessful = objc_msgSend(v4, "safari_BOOLForKey:", @"LoadSuccessful");
      v5->_httpNonGet = objc_msgSend(v4, "safari_BOOLForKey:", @"HTTPNonGet");
      v15 = objc_msgSend(v4, "safari_stringForKey:", @"RedirectSourceURL");
      if (v15)
      {
        v16 = objc_msgSend(v4, "safari_numberForKey:", @"RedirectSourceVisitTime");
        [v16 doubleValue];
        double v18 = v17;

        v19 = [[WBSHistoryVisitIdentifier alloc] initWithURLString:v15 visitTime:v18];
        redirectSourceVisitIdentifier = v5->_redirectSourceVisitIdentifier;
        v5->_redirectSourceVisitIdentifier = v19;
      }
      v21 = objc_msgSend(v4, "safari_stringForKey:", @"RedirectDestinationURL");
      if (v21)
      {
        v22 = objc_msgSend(v4, "safari_numberForKey:", @"RedirectDestinationVisitTime");
        [v22 doubleValue];
        double v24 = v23;

        v25 = [[WBSHistoryVisitIdentifier alloc] initWithURLString:v21 visitTime:v24];
        redirectDestinationVisitIdentifier = v5->_redirectDestinationVisitIdentifier;
        v5->_redirectDestinationVisitIdentifier = v25;
      }
      v27 = v5;
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (WBSCloudHistoryVisit)initWithHistoryVisit:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WBSCloudHistoryVisit;
  v5 = [(WBSCloudHistoryVisit *)&v28 init];
  if (v5)
  {
    v6 = [v4 item];
    v7 = [v6 urlString];

    double v8 = [WBSHistoryVisitIdentifier alloc];
    [v4 visitTime];
    uint64_t v9 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v8, "initWithURLString:visitTime:", v7);
    visitIdentifier = v5->_visitIdentifier;
    v5->_visitIdentifier = (WBSHistoryVisitIdentifier *)v9;

    v11 = [v4 title];
    uint64_t v12 = [v11 copy];
    title = v5->_title;
    v5->_title = (NSString *)v12;

    v5->_loadSuccessful = [v4 loadWasSuccessful];
    v5->_httpNonGet = [v4 wasHTTPNonGet];
    v14 = [v4 redirectSource];
    if (v14)
    {
      v15 = [WBSHistoryVisitIdentifier alloc];
      v16 = [v14 item];
      double v17 = [v16 urlString];
      [v14 visitTime];
      uint64_t v18 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v15, "initWithURLString:visitTime:", v17);
      redirectSourceVisitIdentifier = v5->_redirectSourceVisitIdentifier;
      v5->_redirectSourceVisitIdentifier = (WBSHistoryVisitIdentifier *)v18;
    }
    v20 = [v4 redirectDestination];
    if (v20)
    {
      v21 = [WBSHistoryVisitIdentifier alloc];
      v22 = [v20 item];
      double v23 = [v22 urlString];
      [v20 visitTime];
      uint64_t v24 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v21, "initWithURLString:visitTime:", v23);
      redirectDestinationVisitIdentifier = v5->_redirectDestinationVisitIdentifier;
      v5->_redirectDestinationVisitIdentifier = (WBSHistoryVisitIdentifier *)v24;
    }
    v26 = v5;
  }
  return v5;
}

- (WBSCloudHistoryVisit)initWithVisitIdentifier:(id)a3 title:(id)a4 loadSuccessful:(BOOL)a5 httpNonGet:(BOOL)a6 redirectSourceVisitIdentifier:(id)a7 redirectDestinationVisitIdentifier:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  v23.receiver = self;
  v23.super_class = (Class)WBSCloudHistoryVisit;
  double v17 = [(WBSCloudHistoryVisit *)&v23 init];
  uint64_t v18 = v17;
  v19 = 0;
  if (v13 && v17)
  {
    objc_storeStrong((id *)&v17->_visitIdentifier, a3);
    objc_storeStrong((id *)&v18->_title, a4);
    v18->_loadSuccessful = a5;
    v18->_httpNonGet = a6;
    objc_storeStrong((id *)&v18->_redirectSourceVisitIdentifier, a7);
    objc_storeStrong((id *)&v18->_redirectDestinationVisitIdentifier, a8);
    v19 = v18;
  }

  return v19;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [(WBSHistoryVisitIdentifier *)self->_visitIdentifier urlString];

  if (v3)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    id v4 = [(WBSHistoryVisitIdentifier *)self->_visitIdentifier urlString];
    [v3 setObject:v4 forKeyedSubscript:@"URL"];

    v5 = NSNumber;
    [(WBSHistoryVisitIdentifier *)self->_visitIdentifier visitTime];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"VisitTime"];

    title = self->_title;
    if (title) {
      [v3 setObject:title forKeyedSubscript:@"Title"];
    }
    double v8 = [NSNumber numberWithBool:self->_loadSuccessful];
    [v3 setObject:v8 forKeyedSubscript:@"LoadSuccessful"];

    uint64_t v9 = [NSNumber numberWithBool:self->_httpNonGet];
    [v3 setObject:v9 forKeyedSubscript:@"HTTPNonGet"];

    v10 = [(WBSHistoryVisitIdentifier *)self->_redirectSourceVisitIdentifier urlString];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"RedirectSourceURL"];
      v11 = NSNumber;
      [(WBSHistoryVisitIdentifier *)self->_redirectSourceVisitIdentifier visitTime];
      uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
      [v3 setObject:v12 forKeyedSubscript:@"RedirectSourceVisitTime"];
    }
    id v13 = [(WBSHistoryVisitIdentifier *)self->_redirectDestinationVisitIdentifier urlString];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"RedirectDestinationURL"];
      id v14 = NSNumber;
      [(WBSHistoryVisitIdentifier *)self->_redirectDestinationVisitIdentifier visitTime];
      id v15 = objc_msgSend(v14, "numberWithDouble:");
      [v3 setObject:v15 forKeyedSubscript:@"RedirectDestinationVisitTime"];
    }
  }
  return (NSDictionary *)v3;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WBSHistoryVisitIdentifier *)self->_visitIdentifier urlString];
  [(WBSHistoryVisitIdentifier *)self->_visitIdentifier visitTime];
  uint64_t v8 = v7;
  title = self->_title;
  v10 = [(WBSHistoryVisitIdentifier *)self->_redirectSourceVisitIdentifier urlString];
  v11 = [(WBSHistoryVisitIdentifier *)self->_redirectDestinationVisitIdentifier urlString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; urlString = \"%@\"; visitTime = %lf; title = \"%@\"; redirectSourceURLString = \"%@\"; _redirectDestinationURLString = \"%@\">",
    v5,
    self,
    v6,
    v8,
    title,
    v10,
  uint64_t v12 = v11);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCloudHistoryVisit)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSCloudHistoryVisit;
  v5 = [(WBSCloudHistoryVisit *)&v16 init];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        visitIdentifier = v5->_visitIdentifier,
        v5->_visitIdentifier = (WBSHistoryVisitIdentifier *)v6,
        visitIdentifier,
        v5->_visitIdentifier))
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_loadSuccessful = [v4 decodeBoolForKey:@"LoadSuccessful"];
    v5->_httpNonGet = [v4 decodeBoolForKey:@"HTTPNonGet"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RedirectSourceURL"];
    redirectSourceVisitIdentifier = v5->_redirectSourceVisitIdentifier;
    v5->_redirectSourceVisitIdentifier = (WBSHistoryVisitIdentifier *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RedirectDestinationURL"];
    redirectDestinationVisitIdentifier = v5->_redirectDestinationVisitIdentifier;
    v5->_redirectDestinationVisitIdentifier = (WBSHistoryVisitIdentifier *)v12;

    id v14 = v5;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  visitIdentifier = self->_visitIdentifier;
  id v5 = a3;
  [v5 encodeObject:visitIdentifier forKey:@"URL"];
  [v5 encodeObject:self->_title forKey:@"Title"];
  [v5 encodeBool:self->_loadSuccessful forKey:@"LoadSuccessful"];
  [v5 encodeBool:self->_httpNonGet forKey:@"HTTPNonGet"];
  [v5 encodeObject:self->_redirectSourceVisitIdentifier forKey:@"RedirectSourceURL"];
  [v5 encodeObject:self->_redirectDestinationVisitIdentifier forKey:@"RedirectDestinationURL"];
}

- (WBSHistoryVisitIdentifier)visitIdentifier
{
  return self->_visitIdentifier;
}

- (void)setVisitIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)loadWasSuccessful
{
  return self->_loadSuccessful;
}

- (void)setLoadSuccessful:(BOOL)a3
{
  self->_loadSuccessful = a3;
}

- (BOOL)wasHTTPNonGet
{
  return self->_httpNonGet;
}

- (void)setHttpNonGet:(BOOL)a3
{
  self->_httpNonGet = a3;
}

- (WBSHistoryVisitIdentifier)redirectSourceVisitIdentifier
{
  return self->_redirectSourceVisitIdentifier;
}

- (void)setRedirectSourceVisitIdentifier:(id)a3
{
}

- (WBSCloudHistoryVisit)redirectSourceVisit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redirectSourceVisit);
  return (WBSCloudHistoryVisit *)WeakRetained;
}

- (void)setRedirectSourceVisit:(id)a3
{
}

- (WBSHistoryVisitIdentifier)redirectDestinationVisitIdentifier
{
  return self->_redirectDestinationVisitIdentifier;
}

- (void)setRedirectDestinationVisitIdentifier:(id)a3
{
}

- (WBSCloudHistoryVisit)redirectDestinationVisit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redirectDestinationVisit);
  return (WBSCloudHistoryVisit *)WeakRetained;
}

- (void)setRedirectDestinationVisit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redirectDestinationVisit);
  objc_storeStrong((id *)&self->_redirectDestinationVisitIdentifier, 0);
  objc_destroyWeak((id *)&self->_redirectSourceVisit);
  objc_storeStrong((id *)&self->_redirectSourceVisitIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_visitIdentifier, 0);
}

@end