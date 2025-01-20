@interface PREResponsesExperimentMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmote;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRead;
- (BOOL)isTapBack;
- (NSDate)dateSent;
- (NSString)senderIdentifier;
- (NSString)summaryString;
- (NSString)title;
- (PREResponsesExperimentMessage)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setEmote:(BOOL)a3;
- (void)setRead:(BOOL)a3;
- (void)setSenderIdentifier:(id)a3;
- (void)setSummaryString:(id)a3;
- (void)setTapBack:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PREResponsesExperimentMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_senderIdentifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setDateSent:(id)a3
{
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (BOOL)isRead
{
  return self->_read;
}

- (void)setEmote:(BOOL)a3
{
  self->_emote = a3;
}

- (BOOL)isEmote
{
  return self->_emote;
}

- (void)setTapBack:(BOOL)a3
{
  self->_tapBack = a3;
}

- (BOOL)isTapBack
{
  return self->_tapBack;
}

- (void)setSummaryString:(id)a3
{
}

- (NSString)summaryString
{
  return self->_summaryString;
}

- (void)setSenderIdentifier:(id)a3
{
}

- (NSString)senderIdentifier
{
  return self->_senderIdentifier;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v3 = [(PREResponsesExperimentMessage *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(PREResponsesExperimentMessage *)self senderIdentifier];
  uint64_t v6 = v4 + [v5 hash];
  v7 = [(PREResponsesExperimentMessage *)self summaryString];
  uint64_t v8 = [v7 hash];
  v9 = [(PREResponsesExperimentMessage *)self dateSent];
  unint64_t v10 = v6 + v8 + [v9 hash] + 31;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PREResponsesExperimentMessage *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      unint64_t v8 = [(PREResponsesExperimentMessage *)self hash];
      if (v8 == [(PREResponsesExperimentMessage *)v7 hash])
      {
        title = self->_title;
        unint64_t v10 = [(PREResponsesExperimentMessage *)v7 title];
        if ([(NSString *)title isEqualToString:v10])
        {
          senderIdentifier = self->_senderIdentifier;
          v12 = [(PREResponsesExperimentMessage *)v7 senderIdentifier];
          if ([(NSString *)senderIdentifier isEqualToString:v12])
          {
            summaryString = self->_summaryString;
            v14 = [(PREResponsesExperimentMessage *)v7 summaryString];
            if ([(NSString *)summaryString isEqualToString:v14]
              && (BOOL tapBack = self->_tapBack, tapBack == [(PREResponsesExperimentMessage *)v7 isTapBack])
              && (BOOL emote = self->_emote, emote == [(PREResponsesExperimentMessage *)v7 isEmote])
              && (BOOL read = self->_read, read == [(PREResponsesExperimentMessage *)v7 isRead]))
            {
              dateSent = self->_dateSent;
              v19 = [(PREResponsesExperimentMessage *)v7 dateSent];
              char v6 = [(NSDate *)dateSent isEqualToDate:v19];
            }
            else
            {
              char v6 = 0;
            }
          }
          else
          {
            char v6 = 0;
          }
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = (void *)[(NSString *)self->_title copy];
  [v4 setTitle:v5];

  char v6 = (void *)[(NSString *)self->_senderIdentifier copy];
  [v4 setSenderIdentifier:v6];

  v7 = (void *)[(NSString *)self->_summaryString copy];
  [v4 setSummaryString:v7];

  [v4 setTapBack:self->_tapBack];
  [v4 setEmote:self->_emote];
  [v4 setRead:self->_read];
  unint64_t v8 = (void *)[(NSDate *)self->_dateSent copy];
  [v4 setDateSent:v8];

  return v4;
}

- (PREResponsesExperimentMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PREResponsesExperimentMessage;
  uint64_t v5 = [(PREResponsesExperimentMessage *)&v19 init];
  if (v5)
  {
    char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderIdentifier"];
    uint64_t v10 = [v9 copy];
    senderIdentifier = v5->_senderIdentifier;
    v5->_senderIdentifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summaryString"];
    uint64_t v13 = [v12 copy];
    summaryString = v5->_summaryString;
    v5->_summaryString = (NSString *)v13;

    v5->_BOOL tapBack = [v4 decodeBoolForKey:@"tapBack"];
    v5->_BOOL emote = [v4 decodeBoolForKey:@"emote"];
    v5->_BOOL read = [v4 decodeBoolForKey:@"read"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateSent"];
    dateSent = v5->_dateSent;
    v5->_dateSent = (NSDate *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_senderIdentifier forKey:@"senderIdentifier"];
  [v5 encodeObject:self->_summaryString forKey:@"summaryString"];
  [v5 encodeBool:self->_tapBack forKey:@"tapBack"];
  [v5 encodeBool:self->_emote forKey:@"emote"];
  [v5 encodeBool:self->_read forKey:@"read"];
  [v5 encodeObject:self->_dateSent forKey:@"dateSent"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end