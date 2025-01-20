@interface WFContextualActionContext
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsExpensiveFetch;
- (NSArray)files;
- (NSArray)historicalActionIdentifiers;
- (NSDate)preciseTimestamp;
- (NSString)staccatoInteractionType;
- (WFContextualActionContext)initWithCoder:(id)a3;
- (WFContextualActionContext)initWithSurface:(unint64_t)a3;
- (WFContextualActionContext)initWithSurface:(unint64_t)a3 staccatoInteractionType:(id)a4 preciseTimestamp:(id)a5;
- (unint64_t)surface;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsExpensiveFetch:(BOOL)a3;
- (void)setFiles:(id)a3;
- (void)setHistoricalActionIdentifiers:(id)a3;
- (void)setPreciseTimestamp:(id)a3;
- (void)setStaccatoInteractionType:(id)a3;
- (void)setSurface:(unint64_t)a3;
@end

@implementation WFContextualActionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staccatoInteractionType, 0);
  objc_storeStrong((id *)&self->_preciseTimestamp, 0);
  objc_storeStrong((id *)&self->_historicalActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_files, 0);
}

- (void)setStaccatoInteractionType:(id)a3
{
}

- (NSString)staccatoInteractionType
{
  return self->_staccatoInteractionType;
}

- (void)setPreciseTimestamp:(id)a3
{
}

- (NSDate)preciseTimestamp
{
  return self->_preciseTimestamp;
}

- (void)setHistoricalActionIdentifiers:(id)a3
{
}

- (NSArray)historicalActionIdentifiers
{
  return self->_historicalActionIdentifiers;
}

- (void)setAllowsExpensiveFetch:(BOOL)a3
{
  self->_allowsExpensiveFetch = a3;
}

- (BOOL)allowsExpensiveFetch
{
  return self->_allowsExpensiveFetch;
}

- (void)setFiles:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (void)setSurface:(unint64_t)a3
{
  self->_surface = a3;
}

- (unint64_t)surface
{
  return self->_surface;
}

- (void)encodeWithCoder:(id)a3
{
  files = self->_files;
  id v5 = a3;
  [v5 encodeObject:files forKey:@"files"];
  [v5 encodeInteger:self->_surface forKey:@"surface"];
  [v5 encodeBool:self->_allowsExpensiveFetch forKey:@"allowsExpensiveFetch"];
  [v5 encodeObject:self->_historicalActionIdentifiers forKey:@"historicalActionIdentifiers"];
  [v5 encodeObject:self->_preciseTimestamp forKey:@"preciseTimestamp"];
  [v5 encodeObject:self->_staccatoInteractionType forKey:@"staccatoInteractionType"];
}

- (WFContextualActionContext)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"files"];

  uint64_t v9 = [v5 decodeIntegerForKey:@"surface"];
  char v10 = [v5 decodeBoolForKey:@"allowsExpensiveFetch"];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v5 decodeObjectOfClasses:v13 forKey:@"historicalActionIdentifiers"];

  v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"staccatoInteractionType"];
  v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"preciseTimestamp"];

  v17 = [(WFContextualActionContext *)self initWithSurface:v9 staccatoInteractionType:v15 preciseTimestamp:v16];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_files, v8);
    v18->_allowsExpensiveFetch = v10;
    objc_storeStrong((id *)&v18->_historicalActionIdentifiers, v14);
    v19 = v18;
  }

  return v18;
}

- (WFContextualActionContext)initWithSurface:(unint64_t)a3
{
  return [(WFContextualActionContext *)self initWithSurface:a3 staccatoInteractionType:@"WFStaccatoActionInteractionTypeUnknown" preciseTimestamp:0];
}

- (WFContextualActionContext)initWithSurface:(unint64_t)a3 staccatoInteractionType:(id)a4 preciseTimestamp:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFContextualActionContext;
  v11 = [(WFContextualActionContext *)&v15 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_surface = a3;
    v11->_allowsExpensiveFetch = 0;
    objc_storeStrong((id *)&v11->_preciseTimestamp, a5);
    objc_storeStrong((id *)&v12->_staccatoInteractionType, a4);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end