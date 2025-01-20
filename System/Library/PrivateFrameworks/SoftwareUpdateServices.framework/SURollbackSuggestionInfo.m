@interface SURollbackSuggestionInfo
+ (BOOL)supportsSecureCoding;
- (NSArray)responsibleProcessesInfo;
- (NSString)clientIdentifier;
- (SURollbackSuggestionInfo)init;
- (SURollbackSuggestionInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)suggestionReason;
- (void)encodeWithCoder:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setResponsibleProcessesInfo:(id)a3;
- (void)setSuggestionReason:(unint64_t)a3;
@end

@implementation SURollbackSuggestionInfo

- (SURollbackSuggestionInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)SURollbackSuggestionInfo;
  v2 = [(SURollbackSuggestionInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    clientIdentifier = v2->_clientIdentifier;
    v2->_clientIdentifier = 0;

    responsibleProcessesInfo = v3->_responsibleProcessesInfo;
    v3->_responsibleProcessesInfo = 0;

    v3->_suggestionReason = 0;
  }
  return v3;
}

- (id)description
{
  v2 = NSString;
  clientIdentifier = self->_clientIdentifier;
  responsibleProcessesInfo = self->_responsibleProcessesInfo;
  v5 = SUStringFromRollbackSuggestionReasonType(self->_suggestionReason);
  v6 = [v2 stringWithFormat:@"\n        ClientIdentifier: %@\n        responsibleProcessesInfo: %@\n        Suggestion Reason: %@\n", clientIdentifier, responsibleProcessesInfo, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SURollbackSuggestionInfo)initWithCoder:(id)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SURollbackSuggestionInfo;
  v5 = [(SURollbackSuggestionInfo *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientIdentifier"];
    [(SURollbackSuggestionInfo *)v5 setClientIdentifier:v6];

    objc_super v7 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
    v9 = [v7 setWithArray:v8];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"responsibleProcessesInfo"];
    [(SURollbackSuggestionInfo *)v5 setResponsibleProcessesInfo:v10];

    -[SURollbackSuggestionInfo setSuggestionReason:](v5, "setSuggestionReason:", (int)[v4 decodeIntForKey:@"RollbackSuggestionReason"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(SURollbackSuggestionInfo *)self clientIdentifier];
  [v6 encodeObject:v4 forKey:@"ClientIdentifier"];

  v5 = [(SURollbackSuggestionInfo *)self responsibleProcessesInfo];
  [v6 encodeObject:v5 forKey:@"responsibleProcessesInfo"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[SURollbackSuggestionInfo suggestionReason](self, "suggestionReason"), @"RollbackSuggestionReason");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SURollbackSuggestionInfo);
  v5 = [(SURollbackSuggestionInfo *)self clientIdentifier];
  [(SURollbackSuggestionInfo *)v4 setClientIdentifier:v5];

  id v6 = [(SURollbackSuggestionInfo *)self responsibleProcessesInfo];
  [(SURollbackSuggestionInfo *)v4 setResponsibleProcessesInfo:v6];

  [(SURollbackSuggestionInfo *)v4 setSuggestionReason:[(SURollbackSuggestionInfo *)self suggestionReason]];
  return v4;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSArray)responsibleProcessesInfo
{
  return self->_responsibleProcessesInfo;
}

- (void)setResponsibleProcessesInfo:(id)a3
{
}

- (unint64_t)suggestionReason
{
  return self->_suggestionReason;
}

- (void)setSuggestionReason:(unint64_t)a3
{
  self->_suggestionReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsibleProcessesInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end