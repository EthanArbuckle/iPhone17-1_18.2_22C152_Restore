@interface SFMailRankingSignals
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCountBigramMatchInAttachmentNames;
- (BOOL)hasCountBigramMatchInAttachmentTypes;
- (BOOL)hasCountBigramMatchInAuthorEmailAddresses;
- (BOOL)hasCountBigramMatchInAuthors;
- (BOOL)hasCountBigramMatchInEmailAddresses;
- (BOOL)hasCountBigramMatchInRecipientEmailAddresses;
- (BOOL)hasCountBigramMatchInRecipients;
- (BOOL)hasCountBigramMatchInSubject;
- (BOOL)hasCountBigramMatchInTextContent;
- (BOOL)hasCountBigramPrefixMatchInAttachmentNames;
- (BOOL)hasCountBigramPrefixMatchInAttachmentTypes;
- (BOOL)hasCountBigramPrefixMatchInAuthorEmailAddresses;
- (BOOL)hasCountBigramPrefixMatchInAuthors;
- (BOOL)hasCountBigramPrefixMatchInEmailAddresses;
- (BOOL)hasCountBigramPrefixMatchInRecipientEmailAddresses;
- (BOOL)hasCountBigramPrefixMatchInRecipients;
- (BOOL)hasCountBigramPrefixMatchInSubject;
- (BOOL)hasCountBigramPrefixMatchInTextContent;
- (BOOL)hasCountNgramMatchInAttachmentNames;
- (BOOL)hasCountNgramMatchInAttachmentTypes;
- (BOOL)hasCountNgramMatchInAuthorEmailAddresses;
- (BOOL)hasCountNgramMatchInAuthors;
- (BOOL)hasCountNgramMatchInEmailAddresses;
- (BOOL)hasCountNgramMatchInRecipientEmailAddresses;
- (BOOL)hasCountNgramMatchInRecipients;
- (BOOL)hasCountNgramMatchInSubject;
- (BOOL)hasCountNgramMatchInTextContent;
- (BOOL)hasCountNgramPrefixMatchInAttachmentNames;
- (BOOL)hasCountNgramPrefixMatchInAttachmentTypes;
- (BOOL)hasCountNgramPrefixMatchInAuthorEmailAddresses;
- (BOOL)hasCountNgramPrefixMatchInAuthors;
- (BOOL)hasCountNgramPrefixMatchInEmailAddresses;
- (BOOL)hasCountNgramPrefixMatchInRecipientEmailAddresses;
- (BOOL)hasCountNgramPrefixMatchInRecipients;
- (BOOL)hasCountNgramPrefixMatchInSubject;
- (BOOL)hasCountNgramPrefixMatchInTextContent;
- (BOOL)hasCountUnigramMatchInAttachmentNames;
- (BOOL)hasCountUnigramMatchInAttachmentTypes;
- (BOOL)hasCountUnigramMatchInAuthorEmailAddresses;
- (BOOL)hasCountUnigramMatchInAuthors;
- (BOOL)hasCountUnigramMatchInEmailAddresses;
- (BOOL)hasCountUnigramMatchInRecipientEmailAddresses;
- (BOOL)hasCountUnigramMatchInRecipients;
- (BOOL)hasCountUnigramMatchInSubject;
- (BOOL)hasCountUnigramMatchInTextContent;
- (BOOL)hasCountUnigramPrefixMatchInAttachmentNames;
- (BOOL)hasCountUnigramPrefixMatchInAttachmentTypes;
- (BOOL)hasCountUnigramPrefixMatchInAuthorEmailAddresses;
- (BOOL)hasCountUnigramPrefixMatchInAuthors;
- (BOOL)hasCountUnigramPrefixMatchInEmailAddresses;
- (BOOL)hasCountUnigramPrefixMatchInRecipientEmailAddresses;
- (BOOL)hasCountUnigramPrefixMatchInRecipients;
- (BOOL)hasCountUnigramPrefixMatchInSubject;
- (BOOL)hasCountUnigramPrefixMatchInTextContent;
- (BOOL)hasDaysSinceReceipt;
- (BOOL)hasIsFlagged;
- (BOOL)hasIsRepliedTo;
- (BOOL)hasIsSemanticMatch;
- (BOOL)hasIsSyntacticMatch;
- (BOOL)hasNumDaysEngagedLast30Days;
- (BOOL)hasNumEngagements;
- (BOOL)hasWasReorderedByRecency;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlagged;
- (BOOL)isRepliedTo;
- (BOOL)isSemanticMatch;
- (BOOL)isSyntacticMatch;
- (BOOL)wasReorderedByRecency;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)averageEngagementAgeLast14Days;
- (NSNumber)averageEngagementAgeLast21Days;
- (NSNumber)averageEngagementAgeLast30Days;
- (NSNumber)averageEngagementAgeLast7Days;
- (NSNumber)l1Score;
- (NSNumber)l2Score;
- (NSNumber)semanticScore;
- (NSNumber)syntacticScore;
- (SFMailRankingSignals)initWithCoder:(id)a3;
- (SFMailRankingSignals)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)countBigramMatchInAttachmentNames;
- (unint64_t)countBigramMatchInAttachmentTypes;
- (unint64_t)countBigramMatchInAuthorEmailAddresses;
- (unint64_t)countBigramMatchInAuthors;
- (unint64_t)countBigramMatchInEmailAddresses;
- (unint64_t)countBigramMatchInRecipientEmailAddresses;
- (unint64_t)countBigramMatchInRecipients;
- (unint64_t)countBigramMatchInSubject;
- (unint64_t)countBigramMatchInTextContent;
- (unint64_t)countBigramPrefixMatchInAttachmentNames;
- (unint64_t)countBigramPrefixMatchInAttachmentTypes;
- (unint64_t)countBigramPrefixMatchInAuthorEmailAddresses;
- (unint64_t)countBigramPrefixMatchInAuthors;
- (unint64_t)countBigramPrefixMatchInEmailAddresses;
- (unint64_t)countBigramPrefixMatchInRecipientEmailAddresses;
- (unint64_t)countBigramPrefixMatchInRecipients;
- (unint64_t)countBigramPrefixMatchInSubject;
- (unint64_t)countBigramPrefixMatchInTextContent;
- (unint64_t)countNgramMatchInAttachmentNames;
- (unint64_t)countNgramMatchInAttachmentTypes;
- (unint64_t)countNgramMatchInAuthorEmailAddresses;
- (unint64_t)countNgramMatchInAuthors;
- (unint64_t)countNgramMatchInEmailAddresses;
- (unint64_t)countNgramMatchInRecipientEmailAddresses;
- (unint64_t)countNgramMatchInRecipients;
- (unint64_t)countNgramMatchInSubject;
- (unint64_t)countNgramMatchInTextContent;
- (unint64_t)countNgramPrefixMatchInAttachmentNames;
- (unint64_t)countNgramPrefixMatchInAttachmentTypes;
- (unint64_t)countNgramPrefixMatchInAuthorEmailAddresses;
- (unint64_t)countNgramPrefixMatchInAuthors;
- (unint64_t)countNgramPrefixMatchInEmailAddresses;
- (unint64_t)countNgramPrefixMatchInRecipientEmailAddresses;
- (unint64_t)countNgramPrefixMatchInRecipients;
- (unint64_t)countNgramPrefixMatchInSubject;
- (unint64_t)countNgramPrefixMatchInTextContent;
- (unint64_t)countUnigramMatchInAttachmentNames;
- (unint64_t)countUnigramMatchInAttachmentTypes;
- (unint64_t)countUnigramMatchInAuthorEmailAddresses;
- (unint64_t)countUnigramMatchInAuthors;
- (unint64_t)countUnigramMatchInEmailAddresses;
- (unint64_t)countUnigramMatchInRecipientEmailAddresses;
- (unint64_t)countUnigramMatchInRecipients;
- (unint64_t)countUnigramMatchInSubject;
- (unint64_t)countUnigramMatchInTextContent;
- (unint64_t)countUnigramPrefixMatchInAttachmentNames;
- (unint64_t)countUnigramPrefixMatchInAttachmentTypes;
- (unint64_t)countUnigramPrefixMatchInAuthorEmailAddresses;
- (unint64_t)countUnigramPrefixMatchInAuthors;
- (unint64_t)countUnigramPrefixMatchInEmailAddresses;
- (unint64_t)countUnigramPrefixMatchInRecipientEmailAddresses;
- (unint64_t)countUnigramPrefixMatchInRecipients;
- (unint64_t)countUnigramPrefixMatchInSubject;
- (unint64_t)countUnigramPrefixMatchInTextContent;
- (unint64_t)daysSinceReceipt;
- (unint64_t)hash;
- (unint64_t)numDaysEngagedLast30Days;
- (unint64_t)numEngagements;
- (void)encodeWithCoder:(id)a3;
- (void)setAverageEngagementAgeLast14Days:(id)a3;
- (void)setAverageEngagementAgeLast21Days:(id)a3;
- (void)setAverageEngagementAgeLast30Days:(id)a3;
- (void)setAverageEngagementAgeLast7Days:(id)a3;
- (void)setCountBigramMatchInAttachmentNames:(unint64_t)a3;
- (void)setCountBigramMatchInAttachmentTypes:(unint64_t)a3;
- (void)setCountBigramMatchInAuthorEmailAddresses:(unint64_t)a3;
- (void)setCountBigramMatchInAuthors:(unint64_t)a3;
- (void)setCountBigramMatchInEmailAddresses:(unint64_t)a3;
- (void)setCountBigramMatchInRecipientEmailAddresses:(unint64_t)a3;
- (void)setCountBigramMatchInRecipients:(unint64_t)a3;
- (void)setCountBigramMatchInSubject:(unint64_t)a3;
- (void)setCountBigramMatchInTextContent:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInAttachmentNames:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInAttachmentTypes:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInAuthors:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInEmailAddresses:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInRecipients:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInSubject:(unint64_t)a3;
- (void)setCountBigramPrefixMatchInTextContent:(unint64_t)a3;
- (void)setCountNgramMatchInAttachmentNames:(unint64_t)a3;
- (void)setCountNgramMatchInAttachmentTypes:(unint64_t)a3;
- (void)setCountNgramMatchInAuthorEmailAddresses:(unint64_t)a3;
- (void)setCountNgramMatchInAuthors:(unint64_t)a3;
- (void)setCountNgramMatchInEmailAddresses:(unint64_t)a3;
- (void)setCountNgramMatchInRecipientEmailAddresses:(unint64_t)a3;
- (void)setCountNgramMatchInRecipients:(unint64_t)a3;
- (void)setCountNgramMatchInSubject:(unint64_t)a3;
- (void)setCountNgramMatchInTextContent:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInAttachmentNames:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInAttachmentTypes:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInAuthors:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInEmailAddresses:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInRecipients:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInSubject:(unint64_t)a3;
- (void)setCountNgramPrefixMatchInTextContent:(unint64_t)a3;
- (void)setCountUnigramMatchInAttachmentNames:(unint64_t)a3;
- (void)setCountUnigramMatchInAttachmentTypes:(unint64_t)a3;
- (void)setCountUnigramMatchInAuthorEmailAddresses:(unint64_t)a3;
- (void)setCountUnigramMatchInAuthors:(unint64_t)a3;
- (void)setCountUnigramMatchInEmailAddresses:(unint64_t)a3;
- (void)setCountUnigramMatchInRecipientEmailAddresses:(unint64_t)a3;
- (void)setCountUnigramMatchInRecipients:(unint64_t)a3;
- (void)setCountUnigramMatchInSubject:(unint64_t)a3;
- (void)setCountUnigramMatchInTextContent:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInAttachmentNames:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInAttachmentTypes:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInAuthors:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInEmailAddresses:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInRecipients:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInSubject:(unint64_t)a3;
- (void)setCountUnigramPrefixMatchInTextContent:(unint64_t)a3;
- (void)setDaysSinceReceipt:(unint64_t)a3;
- (void)setIsFlagged:(BOOL)a3;
- (void)setIsRepliedTo:(BOOL)a3;
- (void)setIsSemanticMatch:(BOOL)a3;
- (void)setIsSyntacticMatch:(BOOL)a3;
- (void)setL1Score:(id)a3;
- (void)setL2Score:(id)a3;
- (void)setNumDaysEngagedLast30Days:(unint64_t)a3;
- (void)setNumEngagements:(unint64_t)a3;
- (void)setSemanticScore:(id)a3;
- (void)setSyntacticScore:(id)a3;
- (void)setWasReorderedByRecency:(BOOL)a3;
@end

@implementation SFMailRankingSignals

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntacticScore, 0);
  objc_storeStrong((id *)&self->_semanticScore, 0);
  objc_storeStrong((id *)&self->_l2Score, 0);
  objc_storeStrong((id *)&self->_l1Score, 0);
  objc_storeStrong((id *)&self->_averageEngagementAgeLast30Days, 0);
  objc_storeStrong((id *)&self->_averageEngagementAgeLast21Days, 0);
  objc_storeStrong((id *)&self->_averageEngagementAgeLast14Days, 0);
  objc_storeStrong((id *)&self->_averageEngagementAgeLast7Days, 0);
}

- (unint64_t)countNgramPrefixMatchInAttachmentNames
{
  return self->_countNgramPrefixMatchInAttachmentNames;
}

- (unint64_t)countBigramPrefixMatchInAttachmentNames
{
  return self->_countBigramPrefixMatchInAttachmentNames;
}

- (unint64_t)countUnigramPrefixMatchInAttachmentNames
{
  return self->_countUnigramPrefixMatchInAttachmentNames;
}

- (unint64_t)countNgramMatchInAttachmentNames
{
  return self->_countNgramMatchInAttachmentNames;
}

- (unint64_t)countBigramMatchInAttachmentNames
{
  return self->_countBigramMatchInAttachmentNames;
}

- (unint64_t)countUnigramMatchInAttachmentNames
{
  return self->_countUnigramMatchInAttachmentNames;
}

- (unint64_t)countNgramPrefixMatchInAttachmentTypes
{
  return self->_countNgramPrefixMatchInAttachmentTypes;
}

- (unint64_t)countBigramPrefixMatchInAttachmentTypes
{
  return self->_countBigramPrefixMatchInAttachmentTypes;
}

- (unint64_t)countUnigramPrefixMatchInAttachmentTypes
{
  return self->_countUnigramPrefixMatchInAttachmentTypes;
}

- (unint64_t)countNgramMatchInAttachmentTypes
{
  return self->_countNgramMatchInAttachmentTypes;
}

- (unint64_t)countBigramMatchInAttachmentTypes
{
  return self->_countBigramMatchInAttachmentTypes;
}

- (unint64_t)countUnigramMatchInAttachmentTypes
{
  return self->_countUnigramMatchInAttachmentTypes;
}

- (unint64_t)countNgramPrefixMatchInEmailAddresses
{
  return self->_countNgramPrefixMatchInEmailAddresses;
}

- (unint64_t)countBigramPrefixMatchInEmailAddresses
{
  return self->_countBigramPrefixMatchInEmailAddresses;
}

- (unint64_t)countUnigramPrefixMatchInEmailAddresses
{
  return self->_countUnigramPrefixMatchInEmailAddresses;
}

- (unint64_t)countNgramMatchInEmailAddresses
{
  return self->_countNgramMatchInEmailAddresses;
}

- (unint64_t)countBigramMatchInEmailAddresses
{
  return self->_countBigramMatchInEmailAddresses;
}

- (unint64_t)countUnigramMatchInEmailAddresses
{
  return self->_countUnigramMatchInEmailAddresses;
}

- (unint64_t)countNgramPrefixMatchInRecipientEmailAddresses
{
  return self->_countNgramPrefixMatchInRecipientEmailAddresses;
}

- (unint64_t)countBigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countBigramPrefixMatchInRecipientEmailAddresses;
}

- (unint64_t)countUnigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countUnigramPrefixMatchInRecipientEmailAddresses;
}

- (unint64_t)countNgramMatchInRecipientEmailAddresses
{
  return self->_countNgramMatchInRecipientEmailAddresses;
}

- (unint64_t)countBigramMatchInRecipientEmailAddresses
{
  return self->_countBigramMatchInRecipientEmailAddresses;
}

- (unint64_t)countUnigramMatchInRecipientEmailAddresses
{
  return self->_countUnigramMatchInRecipientEmailAddresses;
}

- (unint64_t)countNgramPrefixMatchInRecipients
{
  return self->_countNgramPrefixMatchInRecipients;
}

- (unint64_t)countBigramPrefixMatchInRecipients
{
  return self->_countBigramPrefixMatchInRecipients;
}

- (unint64_t)countUnigramPrefixMatchInRecipients
{
  return self->_countUnigramPrefixMatchInRecipients;
}

- (unint64_t)countNgramMatchInRecipients
{
  return self->_countNgramMatchInRecipients;
}

- (unint64_t)countBigramMatchInRecipients
{
  return self->_countBigramMatchInRecipients;
}

- (unint64_t)countUnigramMatchInRecipients
{
  return self->_countUnigramMatchInRecipients;
}

- (unint64_t)countNgramPrefixMatchInTextContent
{
  return self->_countNgramPrefixMatchInTextContent;
}

- (unint64_t)countBigramPrefixMatchInTextContent
{
  return self->_countBigramPrefixMatchInTextContent;
}

- (unint64_t)countUnigramPrefixMatchInTextContent
{
  return self->_countUnigramPrefixMatchInTextContent;
}

- (unint64_t)countNgramMatchInTextContent
{
  return self->_countNgramMatchInTextContent;
}

- (unint64_t)countBigramMatchInTextContent
{
  return self->_countBigramMatchInTextContent;
}

- (unint64_t)countUnigramMatchInTextContent
{
  return self->_countUnigramMatchInTextContent;
}

- (unint64_t)countNgramPrefixMatchInSubject
{
  return self->_countNgramPrefixMatchInSubject;
}

- (unint64_t)countBigramPrefixMatchInSubject
{
  return self->_countBigramPrefixMatchInSubject;
}

- (unint64_t)countUnigramPrefixMatchInSubject
{
  return self->_countUnigramPrefixMatchInSubject;
}

- (unint64_t)countNgramMatchInSubject
{
  return self->_countNgramMatchInSubject;
}

- (unint64_t)countBigramMatchInSubject
{
  return self->_countBigramMatchInSubject;
}

- (unint64_t)countUnigramMatchInSubject
{
  return self->_countUnigramMatchInSubject;
}

- (unint64_t)countNgramPrefixMatchInAuthorEmailAddresses
{
  return self->_countNgramPrefixMatchInAuthorEmailAddresses;
}

- (unint64_t)countBigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countBigramPrefixMatchInAuthorEmailAddresses;
}

- (unint64_t)countUnigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countUnigramPrefixMatchInAuthorEmailAddresses;
}

- (unint64_t)countNgramMatchInAuthorEmailAddresses
{
  return self->_countNgramMatchInAuthorEmailAddresses;
}

- (unint64_t)countBigramMatchInAuthorEmailAddresses
{
  return self->_countBigramMatchInAuthorEmailAddresses;
}

- (unint64_t)countUnigramMatchInAuthorEmailAddresses
{
  return self->_countUnigramMatchInAuthorEmailAddresses;
}

- (unint64_t)countNgramPrefixMatchInAuthors
{
  return self->_countNgramPrefixMatchInAuthors;
}

- (unint64_t)countBigramPrefixMatchInAuthors
{
  return self->_countBigramPrefixMatchInAuthors;
}

- (unint64_t)countUnigramPrefixMatchInAuthors
{
  return self->_countUnigramPrefixMatchInAuthors;
}

- (unint64_t)countNgramMatchInAuthors
{
  return self->_countNgramMatchInAuthors;
}

- (unint64_t)countBigramMatchInAuthors
{
  return self->_countBigramMatchInAuthors;
}

- (unint64_t)countUnigramMatchInAuthors
{
  return self->_countUnigramMatchInAuthors;
}

- (void)setSyntacticScore:(id)a3
{
}

- (NSNumber)syntacticScore
{
  return self->_syntacticScore;
}

- (void)setSemanticScore:(id)a3
{
}

- (NSNumber)semanticScore
{
  return self->_semanticScore;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (BOOL)isRepliedTo
{
  return self->_isRepliedTo;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (void)setL2Score:(id)a3
{
}

- (NSNumber)l2Score
{
  return self->_l2Score;
}

- (void)setL1Score:(id)a3
{
}

- (NSNumber)l1Score
{
  return self->_l1Score;
}

- (unint64_t)daysSinceReceipt
{
  return self->_daysSinceReceipt;
}

- (void)setAverageEngagementAgeLast30Days:(id)a3
{
}

- (NSNumber)averageEngagementAgeLast30Days
{
  return self->_averageEngagementAgeLast30Days;
}

- (void)setAverageEngagementAgeLast21Days:(id)a3
{
}

- (NSNumber)averageEngagementAgeLast21Days
{
  return self->_averageEngagementAgeLast21Days;
}

- (void)setAverageEngagementAgeLast14Days:(id)a3
{
}

- (NSNumber)averageEngagementAgeLast14Days
{
  return self->_averageEngagementAgeLast14Days;
}

- (void)setAverageEngagementAgeLast7Days:(id)a3
{
}

- (NSNumber)averageEngagementAgeLast7Days
{
  return self->_averageEngagementAgeLast7Days;
}

- (unint64_t)numDaysEngagedLast30Days
{
  return self->_numDaysEngagedLast30Days;
}

- (unint64_t)numEngagements
{
  return self->_numEngagements;
}

- (BOOL)wasReorderedByRecency
{
  return self->_wasReorderedByRecency;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFMailRankingSignals *)self wasReorderedByRecency];
  unint64_t v4 = [(SFMailRankingSignals *)self numEngagements];
  unint64_t v5 = v4 ^ [(SFMailRankingSignals *)self numDaysEngagedLast30Days];
  v81 = [(SFMailRankingSignals *)self averageEngagementAgeLast7Days];
  uint64_t v6 = v5 ^ [v81 hash] ^ v3;
  v7 = [(SFMailRankingSignals *)self averageEngagementAgeLast14Days];
  uint64_t v8 = [v7 hash];
  v9 = [(SFMailRankingSignals *)self averageEngagementAgeLast21Days];
  uint64_t v10 = v8 ^ [v9 hash];
  v11 = [(SFMailRankingSignals *)self averageEngagementAgeLast30Days];
  uint64_t v12 = v6 ^ v10 ^ [v11 hash];
  unint64_t v13 = [(SFMailRankingSignals *)self daysSinceReceipt];
  v14 = [(SFMailRankingSignals *)self l1Score];
  uint64_t v15 = v13 ^ [v14 hash];
  v16 = [(SFMailRankingSignals *)self l2Score];
  uint64_t v17 = v15 ^ [v16 hash];
  uint64_t v18 = v12 ^ v17 ^ [(SFMailRankingSignals *)self isFlagged];
  uint64_t v19 = [(SFMailRankingSignals *)self isRepliedTo];
  uint64_t v20 = v19 ^ [(SFMailRankingSignals *)self isSemanticMatch];
  uint64_t v21 = v20 ^ [(SFMailRankingSignals *)self isSyntacticMatch];
  v22 = [(SFMailRankingSignals *)self semanticScore];
  uint64_t v23 = v18 ^ v21 ^ [v22 hash];
  v24 = [(SFMailRankingSignals *)self syntacticScore];
  uint64_t v25 = [v24 hash];
  unint64_t v26 = v25 ^ [(SFMailRankingSignals *)self countUnigramMatchInAuthors];
  unint64_t v27 = v26 ^ [(SFMailRankingSignals *)self countBigramMatchInAuthors];
  unint64_t v28 = v27 ^ [(SFMailRankingSignals *)self countNgramMatchInAuthors];
  unint64_t v29 = v28 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInAuthors];
  unint64_t v30 = v23 ^ v29 ^ [(SFMailRankingSignals *)self countBigramPrefixMatchInAuthors];
  unint64_t v31 = [(SFMailRankingSignals *)self countNgramPrefixMatchInAuthors];
  unint64_t v32 = v31 ^ [(SFMailRankingSignals *)self countUnigramMatchInAuthorEmailAddresses];
  unint64_t v33 = v32 ^ [(SFMailRankingSignals *)self countBigramMatchInAuthorEmailAddresses];
  unint64_t v34 = v33 ^ [(SFMailRankingSignals *)self countNgramMatchInAuthorEmailAddresses];
  unint64_t v35 = v34 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInAuthorEmailAddresses];
  unint64_t v36 = v35 ^ [(SFMailRankingSignals *)self countBigramPrefixMatchInAuthorEmailAddresses];
  unint64_t v37 = v36 ^ [(SFMailRankingSignals *)self countNgramPrefixMatchInAuthorEmailAddresses];
  unint64_t v38 = v30 ^ v37 ^ [(SFMailRankingSignals *)self countUnigramMatchInSubject];
  unint64_t v39 = [(SFMailRankingSignals *)self countBigramMatchInSubject];
  unint64_t v40 = v39 ^ [(SFMailRankingSignals *)self countNgramMatchInSubject];
  unint64_t v41 = v40 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInSubject];
  unint64_t v42 = v41 ^ [(SFMailRankingSignals *)self countBigramPrefixMatchInSubject];
  unint64_t v43 = v42 ^ [(SFMailRankingSignals *)self countNgramPrefixMatchInSubject];
  unint64_t v44 = v43 ^ [(SFMailRankingSignals *)self countUnigramMatchInTextContent];
  unint64_t v45 = v44 ^ [(SFMailRankingSignals *)self countBigramMatchInTextContent];
  unint64_t v46 = v45 ^ [(SFMailRankingSignals *)self countNgramMatchInTextContent];
  unint64_t v47 = v38 ^ v46 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInTextContent];
  unint64_t v48 = [(SFMailRankingSignals *)self countBigramPrefixMatchInTextContent];
  unint64_t v49 = v48 ^ [(SFMailRankingSignals *)self countNgramPrefixMatchInTextContent];
  unint64_t v50 = v49 ^ [(SFMailRankingSignals *)self countUnigramMatchInRecipients];
  unint64_t v51 = v50 ^ [(SFMailRankingSignals *)self countBigramMatchInRecipients];
  unint64_t v52 = v51 ^ [(SFMailRankingSignals *)self countNgramMatchInRecipients];
  unint64_t v53 = v52 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInRecipients];
  unint64_t v54 = v53 ^ [(SFMailRankingSignals *)self countBigramPrefixMatchInRecipients];
  unint64_t v55 = v54 ^ [(SFMailRankingSignals *)self countNgramPrefixMatchInRecipients];
  unint64_t v56 = v55 ^ [(SFMailRankingSignals *)self countUnigramMatchInRecipientEmailAddresses];
  unint64_t v57 = v47 ^ v56 ^ [(SFMailRankingSignals *)self countBigramMatchInRecipientEmailAddresses];
  unint64_t v58 = [(SFMailRankingSignals *)self countNgramMatchInRecipientEmailAddresses];
  unint64_t v59 = v58 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInRecipientEmailAddresses];
  unint64_t v60 = v59 ^ [(SFMailRankingSignals *)self countBigramPrefixMatchInRecipientEmailAddresses];
  unint64_t v61 = v60 ^ [(SFMailRankingSignals *)self countNgramPrefixMatchInRecipientEmailAddresses];
  unint64_t v62 = v61 ^ [(SFMailRankingSignals *)self countUnigramMatchInEmailAddresses];
  unint64_t v63 = v62 ^ [(SFMailRankingSignals *)self countBigramMatchInEmailAddresses];
  unint64_t v64 = v63 ^ [(SFMailRankingSignals *)self countNgramMatchInEmailAddresses];
  unint64_t v65 = v64 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInEmailAddresses];
  unint64_t v66 = v65 ^ [(SFMailRankingSignals *)self countBigramPrefixMatchInEmailAddresses];
  unint64_t v67 = v66 ^ [(SFMailRankingSignals *)self countNgramPrefixMatchInEmailAddresses];
  unint64_t v68 = v57 ^ v67 ^ [(SFMailRankingSignals *)self countUnigramMatchInAttachmentTypes];
  unint64_t v69 = [(SFMailRankingSignals *)self countBigramMatchInAttachmentTypes];
  unint64_t v70 = v69 ^ [(SFMailRankingSignals *)self countNgramMatchInAttachmentTypes];
  unint64_t v71 = v70 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInAttachmentTypes];
  unint64_t v72 = v71 ^ [(SFMailRankingSignals *)self countBigramPrefixMatchInAttachmentTypes];
  unint64_t v73 = v72 ^ [(SFMailRankingSignals *)self countNgramPrefixMatchInAttachmentTypes];
  unint64_t v74 = v73 ^ [(SFMailRankingSignals *)self countUnigramMatchInAttachmentNames];
  unint64_t v75 = v74 ^ [(SFMailRankingSignals *)self countBigramMatchInAttachmentNames];
  unint64_t v76 = v75 ^ [(SFMailRankingSignals *)self countNgramMatchInAttachmentNames];
  unint64_t v77 = v76 ^ [(SFMailRankingSignals *)self countUnigramPrefixMatchInAttachmentNames];
  unint64_t v78 = v77 ^ [(SFMailRankingSignals *)self countBigramPrefixMatchInAttachmentNames];
  unint64_t v79 = v68 ^ v78 ^ [(SFMailRankingSignals *)self countNgramPrefixMatchInAttachmentNames];

  return v79;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5 = (SFMailRankingSignals *)a3;
  if (self == v5)
  {
    BOOL v14 = 1;
  }
  else
  {
    if ([(SFMailRankingSignals *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      BOOL v7 = [(SFMailRankingSignals *)self wasReorderedByRecency];
      if (v7 != [(SFMailRankingSignals *)v6 wasReorderedByRecency]
        || (unint64_t v8 = [(SFMailRankingSignals *)self numEngagements],
            v8 != [(SFMailRankingSignals *)v6 numEngagements])
        || (unint64_t v9 = [(SFMailRankingSignals *)self numDaysEngagedLast30Days],
            v9 != [(SFMailRankingSignals *)v6 numDaysEngagedLast30Days]))
      {
        BOOL v14 = 0;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v10 = [(SFMailRankingSignals *)self averageEngagementAgeLast7Days];
      v11 = [(SFMailRankingSignals *)v6 averageEngagementAgeLast7Days];
      if ((v10 == 0) == (v11 != 0))
      {
        BOOL v14 = 0;
LABEL_57:

        goto LABEL_13;
      }
      uint64_t v12 = [(SFMailRankingSignals *)self averageEngagementAgeLast7Days];
      if (v12)
      {
        unint64_t v13 = [(SFMailRankingSignals *)self averageEngagementAgeLast7Days];
        uint64_t v3 = [(SFMailRankingSignals *)v6 averageEngagementAgeLast7Days];
        if (![v13 isEqual:v3])
        {
          BOOL v14 = 0;
          goto LABEL_55;
        }
        v133 = v3;
        v134 = v13;
      }
      v16 = [(SFMailRankingSignals *)self averageEngagementAgeLast14Days];
      uint64_t v17 = [(SFMailRankingSignals *)v6 averageEngagementAgeLast14Days];
      if ((v16 == 0) == (v17 != 0)) {
        goto LABEL_53;
      }
      uint64_t v18 = [(SFMailRankingSignals *)self averageEngagementAgeLast14Days];
      if (v18)
      {
        uint64_t v19 = [(SFMailRankingSignals *)self averageEngagementAgeLast14Days];
        uint64_t v20 = [(SFMailRankingSignals *)v6 averageEngagementAgeLast14Days];
        v130 = (void *)v19;
        uint64_t v21 = (void *)v19;
        uint64_t v3 = (void *)v20;
        if (![v21 isEqual:v20]) {
          goto LABEL_52;
        }
      }
      v131 = v16;
      v132 = v18;
      v22 = [(SFMailRankingSignals *)self averageEngagementAgeLast21Days];
      uint64_t v23 = [(SFMailRankingSignals *)v6 averageEngagementAgeLast21Days];
      if ((v22 == 0) == (v23 != 0))
      {

        goto LABEL_51;
      }
      v127 = v22;
      v128 = v23;
      v129 = [(SFMailRankingSignals *)self averageEngagementAgeLast21Days];
      if (v129)
      {
        v24 = [(SFMailRankingSignals *)self averageEngagementAgeLast21Days];
        v125 = [(SFMailRankingSignals *)v6 averageEngagementAgeLast21Days];
        v126 = v24;
        if (![v24 isEqual:v125]) {
          goto LABEL_49;
        }
      }
      uint64_t v25 = [(SFMailRankingSignals *)self averageEngagementAgeLast30Days];
      unint64_t v26 = [(SFMailRankingSignals *)v6 averageEngagementAgeLast30Days];
      if ((v25 == 0) == (v26 != 0))
      {

        goto LABEL_48;
      }
      v124 = v26;
      v123 = v25;
      unint64_t v27 = [(SFMailRankingSignals *)self averageEngagementAgeLast30Days];
      if (v27)
      {
        [(SFMailRankingSignals *)self averageEngagementAgeLast30Days];
        v29 = unint64_t v28 = v17;
        uint64_t v30 = [(SFMailRankingSignals *)v6 averageEngagementAgeLast30Days];
        v121 = (void *)v29;
        unint64_t v31 = (void *)v29;
        uint64_t v17 = v28;
        uint64_t v25 = (void *)v30;
        if (![v31 isEqual:v30]) {
          goto LABEL_37;
        }
      }
      v122 = v27;
      unint64_t v32 = [(SFMailRankingSignals *)self daysSinceReceipt];
      if (v32 != [(SFMailRankingSignals *)v6 daysSinceReceipt])
      {
        unint64_t v27 = v122;
        if (!v122)
        {
LABEL_47:

LABEL_48:
          uint64_t v18 = v132;
          if (!v129)
          {
LABEL_50:

LABEL_51:
            v16 = v131;
            if (v18)
            {
LABEL_52:
            }
LABEL_53:

            BOOL v14 = 0;
            if (!v12)
            {
LABEL_56:

              goto LABEL_57;
            }
            uint64_t v3 = v133;
            unint64_t v13 = v134;
LABEL_55:

            goto LABEL_56;
          }
LABEL_49:

          goto LABEL_50;
        }
LABEL_37:

        goto LABEL_47;
      }
      v120 = v25;
      unint64_t v33 = [(SFMailRankingSignals *)self l1Score];
      unint64_t v34 = [(SFMailRankingSignals *)v6 l1Score];
      if ((v33 == 0) == (v34 != 0))
      {

        goto LABEL_46;
      }
      v118 = v33;
      v119 = v34;
      unint64_t v35 = [(SFMailRankingSignals *)self l1Score];
      if (v35)
      {
        unint64_t v36 = [(SFMailRankingSignals *)self l1Score];
        v114 = [(SFMailRankingSignals *)v6 l1Score];
        v115 = v36;
        if (!objc_msgSend(v36, "isEqual:"))
        {
LABEL_44:

LABEL_45:
LABEL_46:
          unint64_t v27 = v122;
          uint64_t v25 = v120;
          if (!v122) {
            goto LABEL_47;
          }
          goto LABEL_37;
        }
      }
      v117 = v35;
      unint64_t v37 = [(SFMailRankingSignals *)self l2Score];
      v116 = [(SFMailRankingSignals *)v6 l2Score];
      if ((v37 == 0) == (v116 != 0))
      {

        unint64_t v35 = v117;
        if (!v117) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }
      v113 = v3;
      unint64_t v38 = [(SFMailRankingSignals *)self l2Score];
      if (v38)
      {
        unint64_t v39 = [(SFMailRankingSignals *)self l2Score];
        v111 = [(SFMailRankingSignals *)v6 l2Score];
        v112 = v39;
        if (!objc_msgSend(v39, "isEqual:")) {
          goto LABEL_69;
        }
      }
      BOOL v40 = [(SFMailRankingSignals *)self isFlagged];
      if (v40 == [(SFMailRankingSignals *)v6 isFlagged])
      {
        BOOL v41 = [(SFMailRankingSignals *)self isRepliedTo];
        if (v41 == [(SFMailRankingSignals *)v6 isRepliedTo])
        {
          BOOL v42 = [(SFMailRankingSignals *)self isSemanticMatch];
          if (v42 == [(SFMailRankingSignals *)v6 isSemanticMatch])
          {
            BOOL v43 = [(SFMailRankingSignals *)self isSyntacticMatch];
            if (v43 == [(SFMailRankingSignals *)v6 isSyntacticMatch])
            {
              v110 = [(SFMailRankingSignals *)self semanticScore];
              v109 = [(SFMailRankingSignals *)v6 semanticScore];
              if ((v110 == 0) != (v109 != 0))
              {
                v108 = [(SFMailRankingSignals *)self semanticScore];
                if (v108)
                {
                  unint64_t v44 = [(SFMailRankingSignals *)self semanticScore];
                  v104 = [(SFMailRankingSignals *)v6 semanticScore];
                  v105 = v44;
                  if (!objc_msgSend(v44, "isEqual:"))
                  {
                    BOOL v14 = 0;
                    goto LABEL_145;
                  }
                }
                v107 = [(SFMailRankingSignals *)self syntacticScore];
                v106 = [(SFMailRankingSignals *)v6 syntacticScore];
                if ((v107 == 0) == (v106 != 0))
                {

                  BOOL v14 = 0;
                  goto LABEL_144;
                }
                v103 = [(SFMailRankingSignals *)self syntacticScore];
                if (!v103
                  || ([(SFMailRankingSignals *)self syntacticScore],
                      unint64_t v45 = objc_claimAutoreleasedReturnValue(),
                      [(SFMailRankingSignals *)v6 syntacticScore],
                      v101 = objc_claimAutoreleasedReturnValue(),
                      v102 = v45,
                      objc_msgSend(v45, "isEqual:")))
                {
                  unint64_t v46 = [(SFMailRankingSignals *)self countUnigramMatchInAuthors];
                  if (v46 != [(SFMailRankingSignals *)v6 countUnigramMatchInAuthors]) {
                    goto LABEL_140;
                  }
                  unint64_t v47 = [(SFMailRankingSignals *)self countBigramMatchInAuthors];
                  if (v47 != [(SFMailRankingSignals *)v6 countBigramMatchInAuthors]) {
                    goto LABEL_140;
                  }
                  unint64_t v48 = [(SFMailRankingSignals *)self countNgramMatchInAuthors];
                  if (v48 != [(SFMailRankingSignals *)v6 countNgramMatchInAuthors]) {
                    goto LABEL_140;
                  }
                  unint64_t v49 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInAuthors];
                  if (v49 != [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInAuthors])goto LABEL_140; {
                  unint64_t v50 = [(SFMailRankingSignals *)self countBigramPrefixMatchInAuthors];
                  }
                  if (v50 != [(SFMailRankingSignals *)v6 countBigramPrefixMatchInAuthors])goto LABEL_140; {
                  unint64_t v51 = [(SFMailRankingSignals *)self countNgramPrefixMatchInAuthors];
                  }
                  if (v51 != [(SFMailRankingSignals *)v6 countNgramPrefixMatchInAuthors])goto LABEL_140; {
                  unint64_t v52 = [(SFMailRankingSignals *)self countUnigramMatchInAuthorEmailAddresses];
                  }
                  if (v52 != [(SFMailRankingSignals *)v6 countUnigramMatchInAuthorEmailAddresses])goto LABEL_140; {
                  unint64_t v53 = [(SFMailRankingSignals *)self countBigramMatchInAuthorEmailAddresses];
                  }
                  if (v53 != [(SFMailRankingSignals *)v6 countBigramMatchInAuthorEmailAddresses])goto LABEL_140; {
                  unint64_t v54 = [(SFMailRankingSignals *)self countNgramMatchInAuthorEmailAddresses];
                  }
                  if (v54 != [(SFMailRankingSignals *)v6 countNgramMatchInAuthorEmailAddresses])goto LABEL_140; {
                  unint64_t v55 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInAuthorEmailAddresses];
                  }
                  if (v55 != [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInAuthorEmailAddresses])goto LABEL_140; {
                  unint64_t v56 = [(SFMailRankingSignals *)self countBigramPrefixMatchInAuthorEmailAddresses];
                  }
                  if (v56 != [(SFMailRankingSignals *)v6 countBigramPrefixMatchInAuthorEmailAddresses])goto LABEL_140; {
                  unint64_t v57 = [(SFMailRankingSignals *)self countNgramPrefixMatchInAuthorEmailAddresses];
                  }
                  if (v57 != [(SFMailRankingSignals *)v6 countNgramPrefixMatchInAuthorEmailAddresses])goto LABEL_140; {
                  unint64_t v58 = [(SFMailRankingSignals *)self countUnigramMatchInSubject];
                  }
                  if (v58 != [(SFMailRankingSignals *)v6 countUnigramMatchInSubject]) {
                    goto LABEL_140;
                  }
                  unint64_t v59 = [(SFMailRankingSignals *)self countBigramMatchInSubject];
                  if (v59 != [(SFMailRankingSignals *)v6 countBigramMatchInSubject]) {
                    goto LABEL_140;
                  }
                  unint64_t v60 = [(SFMailRankingSignals *)self countNgramMatchInSubject];
                  if (v60 != [(SFMailRankingSignals *)v6 countNgramMatchInSubject]) {
                    goto LABEL_140;
                  }
                  unint64_t v61 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInSubject];
                  if (v61 != [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInSubject])goto LABEL_140; {
                  unint64_t v62 = [(SFMailRankingSignals *)self countBigramPrefixMatchInSubject];
                  }
                  if (v62 != [(SFMailRankingSignals *)v6 countBigramPrefixMatchInSubject])goto LABEL_140; {
                  unint64_t v63 = [(SFMailRankingSignals *)self countNgramPrefixMatchInSubject];
                  }
                  if (v63 != [(SFMailRankingSignals *)v6 countNgramPrefixMatchInSubject])goto LABEL_140; {
                  unint64_t v64 = [(SFMailRankingSignals *)self countUnigramMatchInTextContent];
                  }
                  if (v64 != [(SFMailRankingSignals *)v6 countUnigramMatchInTextContent])goto LABEL_140; {
                  unint64_t v65 = [(SFMailRankingSignals *)self countBigramMatchInTextContent];
                  }
                  if (v65 != [(SFMailRankingSignals *)v6 countBigramMatchInTextContent]) {
                    goto LABEL_140;
                  }
                  unint64_t v66 = [(SFMailRankingSignals *)self countNgramMatchInTextContent];
                  if (v66 != [(SFMailRankingSignals *)v6 countNgramMatchInTextContent]) {
                    goto LABEL_140;
                  }
                  unint64_t v67 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInTextContent];
                  if (v67 != [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInTextContent])goto LABEL_140; {
                  unint64_t v68 = [(SFMailRankingSignals *)self countBigramPrefixMatchInTextContent];
                  }
                  if (v68 != [(SFMailRankingSignals *)v6 countBigramPrefixMatchInTextContent])goto LABEL_140; {
                  unint64_t v69 = [(SFMailRankingSignals *)self countNgramPrefixMatchInTextContent];
                  }
                  if (v69 != [(SFMailRankingSignals *)v6 countNgramPrefixMatchInTextContent])goto LABEL_140; {
                  unint64_t v70 = [(SFMailRankingSignals *)self countUnigramMatchInRecipients];
                  }
                  if (v70 != [(SFMailRankingSignals *)v6 countUnigramMatchInRecipients]) {
                    goto LABEL_140;
                  }
                  unint64_t v71 = [(SFMailRankingSignals *)self countBigramMatchInRecipients];
                  if (v71 != [(SFMailRankingSignals *)v6 countBigramMatchInRecipients]) {
                    goto LABEL_140;
                  }
                  unint64_t v72 = [(SFMailRankingSignals *)self countNgramMatchInRecipients];
                  if (v72 != [(SFMailRankingSignals *)v6 countNgramMatchInRecipients]) {
                    goto LABEL_140;
                  }
                  unint64_t v73 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInRecipients];
                  if (v73 != [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInRecipients])goto LABEL_140; {
                  unint64_t v74 = [(SFMailRankingSignals *)self countBigramPrefixMatchInRecipients];
                  }
                  if (v74 != [(SFMailRankingSignals *)v6 countBigramPrefixMatchInRecipients])goto LABEL_140; {
                  unint64_t v75 = [(SFMailRankingSignals *)self countNgramPrefixMatchInRecipients];
                  }
                  if (v75 != [(SFMailRankingSignals *)v6 countNgramPrefixMatchInRecipients])goto LABEL_140; {
                  unint64_t v76 = [(SFMailRankingSignals *)self countUnigramMatchInRecipientEmailAddresses];
                  }
                  if (v76 != [(SFMailRankingSignals *)v6 countUnigramMatchInRecipientEmailAddresses])goto LABEL_140; {
                  unint64_t v77 = [(SFMailRankingSignals *)self countBigramMatchInRecipientEmailAddresses];
                  }
                  if (v77 != [(SFMailRankingSignals *)v6 countBigramMatchInRecipientEmailAddresses])goto LABEL_140; {
                  unint64_t v78 = [(SFMailRankingSignals *)self countNgramMatchInRecipientEmailAddresses];
                  }
                  if (v78 != [(SFMailRankingSignals *)v6 countNgramMatchInRecipientEmailAddresses])goto LABEL_140; {
                  unint64_t v79 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInRecipientEmailAddresses];
                  }
                  if (v79 != [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInRecipientEmailAddresses])goto LABEL_140; {
                  unint64_t v80 = [(SFMailRankingSignals *)self countBigramPrefixMatchInRecipientEmailAddresses];
                  }
                  if (v80 != [(SFMailRankingSignals *)v6 countBigramPrefixMatchInRecipientEmailAddresses])goto LABEL_140; {
                  unint64_t v81 = [(SFMailRankingSignals *)self countNgramPrefixMatchInRecipientEmailAddresses];
                  }
                  if (v81 != [(SFMailRankingSignals *)v6 countNgramPrefixMatchInRecipientEmailAddresses])goto LABEL_140; {
                  unint64_t v82 = [(SFMailRankingSignals *)self countUnigramMatchInEmailAddresses];
                  }
                  if (v82 != [(SFMailRankingSignals *)v6 countUnigramMatchInEmailAddresses])goto LABEL_140; {
                  unint64_t v83 = [(SFMailRankingSignals *)self countBigramMatchInEmailAddresses];
                  }
                  if (v83 != [(SFMailRankingSignals *)v6 countBigramMatchInEmailAddresses])goto LABEL_140; {
                  unint64_t v84 = [(SFMailRankingSignals *)self countNgramMatchInEmailAddresses];
                  }
                  if (v84 != [(SFMailRankingSignals *)v6 countNgramMatchInEmailAddresses])goto LABEL_140; {
                  unint64_t v85 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInEmailAddresses];
                  }
                  if (v85 != [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInEmailAddresses])goto LABEL_140; {
                  unint64_t v86 = [(SFMailRankingSignals *)self countBigramPrefixMatchInEmailAddresses];
                  }
                  if (v86 != [(SFMailRankingSignals *)v6 countBigramPrefixMatchInEmailAddresses])goto LABEL_140; {
                  unint64_t v87 = [(SFMailRankingSignals *)self countNgramPrefixMatchInEmailAddresses];
                  }
                  if (v87 != [(SFMailRankingSignals *)v6 countNgramPrefixMatchInEmailAddresses])goto LABEL_140; {
                  unint64_t v88 = [(SFMailRankingSignals *)self countUnigramMatchInAttachmentTypes];
                  }
                  if (v88 != [(SFMailRankingSignals *)v6 countUnigramMatchInAttachmentTypes])goto LABEL_140; {
                  unint64_t v89 = [(SFMailRankingSignals *)self countBigramMatchInAttachmentTypes];
                  }
                  if (v89 != [(SFMailRankingSignals *)v6 countBigramMatchInAttachmentTypes])goto LABEL_140; {
                  unint64_t v90 = [(SFMailRankingSignals *)self countNgramMatchInAttachmentTypes];
                  }
                  if (v90 != [(SFMailRankingSignals *)v6 countNgramMatchInAttachmentTypes])goto LABEL_140; {
                  unint64_t v91 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInAttachmentTypes];
                  }
                  if (v91 != [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInAttachmentTypes])goto LABEL_140; {
                  unint64_t v92 = [(SFMailRankingSignals *)self countBigramPrefixMatchInAttachmentTypes];
                  }
                  if (v92 == -[SFMailRankingSignals countBigramPrefixMatchInAttachmentTypes](v6, "countBigramPrefixMatchInAttachmentTypes")&& (unint64_t v93 = -[SFMailRankingSignals countNgramPrefixMatchInAttachmentTypes](self, "countNgramPrefixMatchInAttachmentTypes"), v93 == -[SFMailRankingSignals countNgramPrefixMatchInAttachmentTypes](v6, "countNgramPrefixMatchInAttachmentTypes"))&& (v94 = -[SFMailRankingSignals countUnigramMatchInAttachmentNames](self, "countUnigramMatchInAttachmentNames"), v94 == -[SFMailRankingSignals countUnigramMatchInAttachmentNames](v6, "countUnigramMatchInAttachmentNames"))&& (v95 = -[SFMailRankingSignals countBigramMatchInAttachmentNames](self, "countBigramMatchInAttachmentNames"), v95 == -[SFMailRankingSignals countBigramMatchInAttachmentNames](v6,
                                 "countBigramMatchInAttachmentNames"))
                    && (unint64_t v96 = [(SFMailRankingSignals *)self countNgramMatchInAttachmentNames], v96 == [(SFMailRankingSignals *)v6 countNgramMatchInAttachmentNames])&& (v97 = [(SFMailRankingSignals *)self countUnigramPrefixMatchInAttachmentNames], v97 == [(SFMailRankingSignals *)v6 countUnigramPrefixMatchInAttachmentNames])&& (v98 = [(SFMailRankingSignals *)self countBigramPrefixMatchInAttachmentNames], v98 == [(SFMailRankingSignals *)v6 countBigramPrefixMatchInAttachmentNames]))
                  {
                    unint64_t v99 = [(SFMailRankingSignals *)self countNgramPrefixMatchInAttachmentNames];
                    BOOL v14 = v99 == [(SFMailRankingSignals *)v6 countNgramPrefixMatchInAttachmentNames];
                    BOOL v100 = v14;
                  }
                  else
                  {
LABEL_140:
                    BOOL v14 = 0;
                    BOOL v100 = 0;
                  }
                  if (!v103)
                  {

                    BOOL v14 = v100;
LABEL_144:
                    if (!v108)
                    {
LABEL_146:

                      if (v38)
                      {
                      }
                      if (v117)
                      {
                      }
                      if (v122)
                      {
                      }
                      if (v129)
                      {
                      }
                      if (v132)
                      {
                      }
LABEL_79:
                      uint64_t v3 = v133;
                      unint64_t v13 = v134;
                      if (!v12) {
                        goto LABEL_56;
                      }
                      goto LABEL_55;
                    }
LABEL_145:

                    goto LABEL_146;
                  }
                }
                else
                {
                  BOOL v14 = 0;
                }

                goto LABEL_144;
              }
            }
          }
        }
      }
      if (!v38)
      {
LABEL_70:

        if (v117)
        {
        }
        if (v122)
        {
        }
        if (v129)
        {
        }
        if (v132)
        {
        }
        BOOL v14 = 0;
        goto LABEL_79;
      }
LABEL_69:

      goto LABEL_70;
    }
    BOOL v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setWasReorderedByRecency:", -[SFMailRankingSignals wasReorderedByRecency](self, "wasReorderedByRecency"));
  objc_msgSend(v4, "setNumEngagements:", -[SFMailRankingSignals numEngagements](self, "numEngagements"));
  objc_msgSend(v4, "setNumDaysEngagedLast30Days:", -[SFMailRankingSignals numDaysEngagedLast30Days](self, "numDaysEngagedLast30Days"));
  unint64_t v5 = [(SFMailRankingSignals *)self averageEngagementAgeLast7Days];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setAverageEngagementAgeLast7Days:v6];

  BOOL v7 = [(SFMailRankingSignals *)self averageEngagementAgeLast14Days];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setAverageEngagementAgeLast14Days:v8];

  unint64_t v9 = [(SFMailRankingSignals *)self averageEngagementAgeLast21Days];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setAverageEngagementAgeLast21Days:v10];

  v11 = [(SFMailRankingSignals *)self averageEngagementAgeLast30Days];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setAverageEngagementAgeLast30Days:v12];

  objc_msgSend(v4, "setDaysSinceReceipt:", -[SFMailRankingSignals daysSinceReceipt](self, "daysSinceReceipt"));
  unint64_t v13 = [(SFMailRankingSignals *)self l1Score];
  BOOL v14 = (void *)[v13 copy];
  [v4 setL1Score:v14];

  uint64_t v15 = [(SFMailRankingSignals *)self l2Score];
  v16 = (void *)[v15 copy];
  [v4 setL2Score:v16];

  objc_msgSend(v4, "setIsFlagged:", -[SFMailRankingSignals isFlagged](self, "isFlagged"));
  objc_msgSend(v4, "setIsRepliedTo:", -[SFMailRankingSignals isRepliedTo](self, "isRepliedTo"));
  objc_msgSend(v4, "setIsSemanticMatch:", -[SFMailRankingSignals isSemanticMatch](self, "isSemanticMatch"));
  objc_msgSend(v4, "setIsSyntacticMatch:", -[SFMailRankingSignals isSyntacticMatch](self, "isSyntacticMatch"));
  uint64_t v17 = [(SFMailRankingSignals *)self semanticScore];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setSemanticScore:v18];

  uint64_t v19 = [(SFMailRankingSignals *)self syntacticScore];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setSyntacticScore:v20];

  objc_msgSend(v4, "setCountUnigramMatchInAuthors:", -[SFMailRankingSignals countUnigramMatchInAuthors](self, "countUnigramMatchInAuthors"));
  objc_msgSend(v4, "setCountBigramMatchInAuthors:", -[SFMailRankingSignals countBigramMatchInAuthors](self, "countBigramMatchInAuthors"));
  objc_msgSend(v4, "setCountNgramMatchInAuthors:", -[SFMailRankingSignals countNgramMatchInAuthors](self, "countNgramMatchInAuthors"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInAuthors:", -[SFMailRankingSignals countUnigramPrefixMatchInAuthors](self, "countUnigramPrefixMatchInAuthors"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInAuthors:", -[SFMailRankingSignals countBigramPrefixMatchInAuthors](self, "countBigramPrefixMatchInAuthors"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInAuthors:", -[SFMailRankingSignals countNgramPrefixMatchInAuthors](self, "countNgramPrefixMatchInAuthors"));
  objc_msgSend(v4, "setCountUnigramMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countUnigramMatchInAuthorEmailAddresses](self, "countUnigramMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountBigramMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countBigramMatchInAuthorEmailAddresses](self, "countBigramMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountNgramMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countNgramMatchInAuthorEmailAddresses](self, "countNgramMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countUnigramPrefixMatchInAuthorEmailAddresses](self, "countUnigramPrefixMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countBigramPrefixMatchInAuthorEmailAddresses](self, "countBigramPrefixMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countNgramPrefixMatchInAuthorEmailAddresses](self, "countNgramPrefixMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramMatchInSubject:", -[SFMailRankingSignals countUnigramMatchInSubject](self, "countUnigramMatchInSubject"));
  objc_msgSend(v4, "setCountBigramMatchInSubject:", -[SFMailRankingSignals countBigramMatchInSubject](self, "countBigramMatchInSubject"));
  objc_msgSend(v4, "setCountNgramMatchInSubject:", -[SFMailRankingSignals countNgramMatchInSubject](self, "countNgramMatchInSubject"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInSubject:", -[SFMailRankingSignals countUnigramPrefixMatchInSubject](self, "countUnigramPrefixMatchInSubject"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInSubject:", -[SFMailRankingSignals countBigramPrefixMatchInSubject](self, "countBigramPrefixMatchInSubject"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInSubject:", -[SFMailRankingSignals countNgramPrefixMatchInSubject](self, "countNgramPrefixMatchInSubject"));
  objc_msgSend(v4, "setCountUnigramMatchInTextContent:", -[SFMailRankingSignals countUnigramMatchInTextContent](self, "countUnigramMatchInTextContent"));
  objc_msgSend(v4, "setCountBigramMatchInTextContent:", -[SFMailRankingSignals countBigramMatchInTextContent](self, "countBigramMatchInTextContent"));
  objc_msgSend(v4, "setCountNgramMatchInTextContent:", -[SFMailRankingSignals countNgramMatchInTextContent](self, "countNgramMatchInTextContent"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInTextContent:", -[SFMailRankingSignals countUnigramPrefixMatchInTextContent](self, "countUnigramPrefixMatchInTextContent"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInTextContent:", -[SFMailRankingSignals countBigramPrefixMatchInTextContent](self, "countBigramPrefixMatchInTextContent"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInTextContent:", -[SFMailRankingSignals countNgramPrefixMatchInTextContent](self, "countNgramPrefixMatchInTextContent"));
  objc_msgSend(v4, "setCountUnigramMatchInRecipients:", -[SFMailRankingSignals countUnigramMatchInRecipients](self, "countUnigramMatchInRecipients"));
  objc_msgSend(v4, "setCountBigramMatchInRecipients:", -[SFMailRankingSignals countBigramMatchInRecipients](self, "countBigramMatchInRecipients"));
  objc_msgSend(v4, "setCountNgramMatchInRecipients:", -[SFMailRankingSignals countNgramMatchInRecipients](self, "countNgramMatchInRecipients"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInRecipients:", -[SFMailRankingSignals countUnigramPrefixMatchInRecipients](self, "countUnigramPrefixMatchInRecipients"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInRecipients:", -[SFMailRankingSignals countBigramPrefixMatchInRecipients](self, "countBigramPrefixMatchInRecipients"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInRecipients:", -[SFMailRankingSignals countNgramPrefixMatchInRecipients](self, "countNgramPrefixMatchInRecipients"));
  objc_msgSend(v4, "setCountUnigramMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countUnigramMatchInRecipientEmailAddresses](self, "countUnigramMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountBigramMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countBigramMatchInRecipientEmailAddresses](self, "countBigramMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountNgramMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countNgramMatchInRecipientEmailAddresses](self, "countNgramMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countUnigramPrefixMatchInRecipientEmailAddresses](self, "countUnigramPrefixMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countBigramPrefixMatchInRecipientEmailAddresses](self, "countBigramPrefixMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countNgramPrefixMatchInRecipientEmailAddresses](self, "countNgramPrefixMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramMatchInEmailAddresses:", -[SFMailRankingSignals countUnigramMatchInEmailAddresses](self, "countUnigramMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountBigramMatchInEmailAddresses:", -[SFMailRankingSignals countBigramMatchInEmailAddresses](self, "countBigramMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountNgramMatchInEmailAddresses:", -[SFMailRankingSignals countNgramMatchInEmailAddresses](self, "countNgramMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInEmailAddresses:", -[SFMailRankingSignals countUnigramPrefixMatchInEmailAddresses](self, "countUnigramPrefixMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInEmailAddresses:", -[SFMailRankingSignals countBigramPrefixMatchInEmailAddresses](self, "countBigramPrefixMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInEmailAddresses:", -[SFMailRankingSignals countNgramPrefixMatchInEmailAddresses](self, "countNgramPrefixMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramMatchInAttachmentTypes:", -[SFMailRankingSignals countUnigramMatchInAttachmentTypes](self, "countUnigramMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountBigramMatchInAttachmentTypes:", -[SFMailRankingSignals countBigramMatchInAttachmentTypes](self, "countBigramMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountNgramMatchInAttachmentTypes:", -[SFMailRankingSignals countNgramMatchInAttachmentTypes](self, "countNgramMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInAttachmentTypes:", -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentTypes](self, "countUnigramPrefixMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInAttachmentTypes:", -[SFMailRankingSignals countBigramPrefixMatchInAttachmentTypes](self, "countBigramPrefixMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInAttachmentTypes:", -[SFMailRankingSignals countNgramPrefixMatchInAttachmentTypes](self, "countNgramPrefixMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountUnigramMatchInAttachmentNames:", -[SFMailRankingSignals countUnigramMatchInAttachmentNames](self, "countUnigramMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountBigramMatchInAttachmentNames:", -[SFMailRankingSignals countBigramMatchInAttachmentNames](self, "countBigramMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountNgramMatchInAttachmentNames:", -[SFMailRankingSignals countNgramMatchInAttachmentNames](self, "countNgramMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInAttachmentNames:", -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentNames](self, "countUnigramPrefixMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInAttachmentNames:", -[SFMailRankingSignals countBigramPrefixMatchInAttachmentNames](self, "countBigramPrefixMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInAttachmentNames:", -[SFMailRankingSignals countNgramPrefixMatchInAttachmentNames](self, "countNgramPrefixMatchInAttachmentNames"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMailRankingSignals alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMailRankingSignals *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMailRankingSignals alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMailRankingSignals *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBMailRankingSignals alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBMailRankingSignals *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMailRankingSignals)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBMailRankingSignals alloc] initWithData:v5];
  BOOL v7 = [(SFMailRankingSignals *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasCountNgramPrefixMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (void)setCountNgramPrefixMatchInAttachmentNames:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_countNgramPrefixMatchInAttachmentNames = a3;
}

- (BOOL)hasCountBigramPrefixMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setCountBigramPrefixMatchInAttachmentNames:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_countBigramPrefixMatchInAttachmentNames = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setCountUnigramPrefixMatchInAttachmentNames:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_countUnigramPrefixMatchInAttachmentNames = a3;
}

- (BOOL)hasCountNgramMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (void)setCountNgramMatchInAttachmentNames:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_countNgramMatchInAttachmentNames = a3;
}

- (BOOL)hasCountBigramMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setCountBigramMatchInAttachmentNames:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_countBigramMatchInAttachmentNames = a3;
}

- (BOOL)hasCountUnigramMatchInAttachmentNames
{
  return *((unsigned char *)&self->_has + 7) & 1;
}

- (void)setCountUnigramMatchInAttachmentNames:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_countUnigramMatchInAttachmentNames = a3;
}

- (BOOL)hasCountNgramPrefixMatchInAttachmentTypes
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setCountNgramPrefixMatchInAttachmentTypes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_countNgramPrefixMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountBigramPrefixMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setCountBigramPrefixMatchInAttachmentTypes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_countBigramPrefixMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setCountUnigramPrefixMatchInAttachmentTypes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_countUnigramPrefixMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountNgramMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setCountNgramMatchInAttachmentTypes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_countNgramMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountBigramMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setCountBigramMatchInAttachmentTypes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_countBigramMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountUnigramMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setCountUnigramMatchInAttachmentTypes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_countUnigramMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountNgramPrefixMatchInEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setCountNgramPrefixMatchInEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_countNgramPrefixMatchInEmailAddresses = a3;
}

- (BOOL)hasCountBigramPrefixMatchInEmailAddresses
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setCountBigramPrefixMatchInEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_countBigramPrefixMatchInEmailAddresses = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInEmailAddresses
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setCountUnigramPrefixMatchInEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_countUnigramPrefixMatchInEmailAddresses = a3;
}

- (BOOL)hasCountNgramMatchInEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setCountNgramMatchInEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_countNgramMatchInEmailAddresses = a3;
}

- (BOOL)hasCountBigramMatchInEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setCountBigramMatchInEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_countBigramMatchInEmailAddresses = a3;
}

- (BOOL)hasCountUnigramMatchInEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setCountUnigramMatchInEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_countUnigramMatchInEmailAddresses = a3;
}

- (BOOL)hasCountNgramPrefixMatchInRecipientEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setCountNgramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_countNgramPrefixMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountBigramPrefixMatchInRecipientEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setCountBigramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_countBigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInRecipientEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setCountUnigramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_countUnigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountNgramMatchInRecipientEmailAddresses
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setCountNgramMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_countNgramMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountBigramMatchInRecipientEmailAddresses
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCountBigramMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_countBigramMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountUnigramMatchInRecipientEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setCountUnigramMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_countUnigramMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountNgramPrefixMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCountNgramPrefixMatchInRecipients:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_countNgramPrefixMatchInRecipients = a3;
}

- (BOOL)hasCountBigramPrefixMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setCountBigramPrefixMatchInRecipients:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_countBigramPrefixMatchInRecipients = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setCountUnigramPrefixMatchInRecipients:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_countUnigramPrefixMatchInRecipients = a3;
}

- (BOOL)hasCountNgramMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setCountNgramMatchInRecipients:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_countNgramMatchInRecipients = a3;
}

- (BOOL)hasCountBigramMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setCountBigramMatchInRecipients:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_countBigramMatchInRecipients = a3;
}

- (BOOL)hasCountUnigramMatchInRecipients
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setCountUnigramMatchInRecipients:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_countUnigramMatchInRecipients = a3;
}

- (BOOL)hasCountNgramPrefixMatchInTextContent
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setCountNgramPrefixMatchInTextContent:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_countNgramPrefixMatchInTextContent = a3;
}

- (BOOL)hasCountBigramPrefixMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setCountBigramPrefixMatchInTextContent:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_countBigramPrefixMatchInTextContent = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setCountUnigramPrefixMatchInTextContent:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_countUnigramPrefixMatchInTextContent = a3;
}

- (BOOL)hasCountNgramMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setCountNgramMatchInTextContent:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_countNgramMatchInTextContent = a3;
}

- (BOOL)hasCountBigramMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setCountBigramMatchInTextContent:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_countBigramMatchInTextContent = a3;
}

- (BOOL)hasCountUnigramMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCountUnigramMatchInTextContent:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_countUnigramMatchInTextContent = a3;
}

- (BOOL)hasCountNgramPrefixMatchInSubject
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCountNgramPrefixMatchInSubject:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_countNgramPrefixMatchInSubject = a3;
}

- (BOOL)hasCountBigramPrefixMatchInSubject
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setCountBigramPrefixMatchInSubject:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_countBigramPrefixMatchInSubject = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInSubject
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setCountUnigramPrefixMatchInSubject:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_countUnigramPrefixMatchInSubject = a3;
}

- (BOOL)hasCountNgramMatchInSubject
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setCountNgramMatchInSubject:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_countNgramMatchInSubject = a3;
}

- (BOOL)hasCountBigramMatchInSubject
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setCountBigramMatchInSubject:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_countBigramMatchInSubject = a3;
}

- (BOOL)hasCountUnigramMatchInSubject
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCountUnigramMatchInSubject:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_countUnigramMatchInSubject = a3;
}

- (BOOL)hasCountNgramPrefixMatchInAuthorEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setCountNgramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_countNgramPrefixMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountBigramPrefixMatchInAuthorEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCountBigramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_countBigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInAuthorEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCountUnigramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_countUnigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountNgramMatchInAuthorEmailAddresses
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setCountNgramMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_countNgramMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountBigramMatchInAuthorEmailAddresses
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCountBigramMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_countBigramMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountUnigramMatchInAuthorEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCountUnigramMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_countUnigramMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountNgramPrefixMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCountNgramPrefixMatchInAuthors:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_countNgramPrefixMatchInAuthors = a3;
}

- (BOOL)hasCountBigramPrefixMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCountBigramPrefixMatchInAuthors:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_countBigramPrefixMatchInAuthors = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCountUnigramPrefixMatchInAuthors:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_countUnigramPrefixMatchInAuthors = a3;
}

- (BOOL)hasCountNgramMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCountNgramMatchInAuthors:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_countNgramMatchInAuthors = a3;
}

- (BOOL)hasCountBigramMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCountBigramMatchInAuthors:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_countBigramMatchInAuthors = a3;
}

- (BOOL)hasCountUnigramMatchInAuthors
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setCountUnigramMatchInAuthors:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_countUnigramMatchInAuthors = a3;
}

- (BOOL)hasIsSyntacticMatch
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_isSyntacticMatch = a3;
}

- (BOOL)hasIsSemanticMatch
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_isSemanticMatch = a3;
}

- (BOOL)hasIsRepliedTo
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsRepliedTo:(BOOL)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_isRepliedTo = a3;
}

- (BOOL)hasIsFlagged
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsFlagged:(BOOL)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_isFlagged = a3;
}

- (BOOL)hasDaysSinceReceipt
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDaysSinceReceipt:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_daysSinceReceipt = a3;
}

- (BOOL)hasNumDaysEngagedLast30Days
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumDaysEngagedLast30Days:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_numDaysEngagedLast30Days = a3;
}

- (BOOL)hasNumEngagements
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumEngagements:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_numEngagements = a3;
}

- (BOOL)hasWasReorderedByRecency
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWasReorderedByRecency:(BOOL)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_wasReorderedByRecency = a3;
}

- (SFMailRankingSignals)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFMailRankingSignals;
  unint64_t v5 = [(SFMailRankingSignals *)&v24 init];

  if (v5)
  {
    if ([v4 wasReorderedByRecency]) {
      -[SFMailRankingSignals setWasReorderedByRecency:](v5, "setWasReorderedByRecency:", [v4 wasReorderedByRecency]);
    }
    if ([v4 numEngagements]) {
      -[SFMailRankingSignals setNumEngagements:](v5, "setNumEngagements:", [v4 numEngagements]);
    }
    if ([v4 numDaysEngagedLast30Days]) {
      -[SFMailRankingSignals setNumDaysEngagedLast30Days:](v5, "setNumDaysEngagedLast30Days:", [v4 numDaysEngagedLast30Days]);
    }
    if ([v4 averageEngagementAgeLast7Days])
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "averageEngagementAgeLast7Days"));
      [(SFMailRankingSignals *)v5 setAverageEngagementAgeLast7Days:v6];
    }
    if ([v4 averageEngagementAgeLast14Days])
    {
      BOOL v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "averageEngagementAgeLast14Days"));
      [(SFMailRankingSignals *)v5 setAverageEngagementAgeLast14Days:v7];
    }
    if ([v4 averageEngagementAgeLast21Days])
    {
      unint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "averageEngagementAgeLast21Days"));
      [(SFMailRankingSignals *)v5 setAverageEngagementAgeLast21Days:v8];
    }
    if ([v4 averageEngagementAgeLast30Days])
    {
      unint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "averageEngagementAgeLast30Days"));
      [(SFMailRankingSignals *)v5 setAverageEngagementAgeLast30Days:v9];
    }
    if ([v4 daysSinceReceipt]) {
      -[SFMailRankingSignals setDaysSinceReceipt:](v5, "setDaysSinceReceipt:", [v4 daysSinceReceipt]);
    }
    [v4 l1Score];
    if (v10 != 0.0)
    {
      v11 = NSNumber;
      [v4 l1Score];
      uint64_t v12 = objc_msgSend(v11, "numberWithFloat:");
      [(SFMailRankingSignals *)v5 setL1Score:v12];
    }
    [v4 l2Score];
    if (v13 != 0.0)
    {
      BOOL v14 = NSNumber;
      [v4 l2Score];
      uint64_t v15 = objc_msgSend(v14, "numberWithFloat:");
      [(SFMailRankingSignals *)v5 setL2Score:v15];
    }
    if ([v4 isFlagged]) {
      -[SFMailRankingSignals setIsFlagged:](v5, "setIsFlagged:", [v4 isFlagged]);
    }
    if ([v4 isRepliedTo]) {
      -[SFMailRankingSignals setIsRepliedTo:](v5, "setIsRepliedTo:", [v4 isRepliedTo]);
    }
    if ([v4 isSemanticMatch]) {
      -[SFMailRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", [v4 isSemanticMatch]);
    }
    if ([v4 isSyntacticMatch]) {
      -[SFMailRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", [v4 isSyntacticMatch]);
    }
    [v4 semanticScore];
    if (v16 != 0.0)
    {
      uint64_t v17 = NSNumber;
      [v4 semanticScore];
      uint64_t v18 = objc_msgSend(v17, "numberWithFloat:");
      [(SFMailRankingSignals *)v5 setSemanticScore:v18];
    }
    [v4 syntacticScore];
    if (v19 != 0.0)
    {
      uint64_t v20 = NSNumber;
      [v4 syntacticScore];
      uint64_t v21 = objc_msgSend(v20, "numberWithFloat:");
      [(SFMailRankingSignals *)v5 setSyntacticScore:v21];
    }
    if ([v4 countUnigramMatchInAuthors]) {
      -[SFMailRankingSignals setCountUnigramMatchInAuthors:](v5, "setCountUnigramMatchInAuthors:", [v4 countUnigramMatchInAuthors]);
    }
    if ([v4 countBigramMatchInAuthors]) {
      -[SFMailRankingSignals setCountBigramMatchInAuthors:](v5, "setCountBigramMatchInAuthors:", [v4 countBigramMatchInAuthors]);
    }
    if ([v4 countNgramMatchInAuthors]) {
      -[SFMailRankingSignals setCountNgramMatchInAuthors:](v5, "setCountNgramMatchInAuthors:", [v4 countNgramMatchInAuthors]);
    }
    if ([v4 countUnigramPrefixMatchInAuthors]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInAuthors:](v5, "setCountUnigramPrefixMatchInAuthors:", [v4 countUnigramPrefixMatchInAuthors]);
    }
    if ([v4 countBigramPrefixMatchInAuthors]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInAuthors:](v5, "setCountBigramPrefixMatchInAuthors:", [v4 countBigramPrefixMatchInAuthors]);
    }
    if ([v4 countNgramPrefixMatchInAuthors]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInAuthors:](v5, "setCountNgramPrefixMatchInAuthors:", [v4 countNgramPrefixMatchInAuthors]);
    }
    if ([v4 countUnigramMatchInAuthorEmailAddresses]) {
      -[SFMailRankingSignals setCountUnigramMatchInAuthorEmailAddresses:](v5, "setCountUnigramMatchInAuthorEmailAddresses:", [v4 countUnigramMatchInAuthorEmailAddresses]);
    }
    if ([v4 countBigramMatchInAuthorEmailAddresses]) {
      -[SFMailRankingSignals setCountBigramMatchInAuthorEmailAddresses:](v5, "setCountBigramMatchInAuthorEmailAddresses:", [v4 countBigramMatchInAuthorEmailAddresses]);
    }
    if ([v4 countNgramMatchInAuthorEmailAddresses]) {
      -[SFMailRankingSignals setCountNgramMatchInAuthorEmailAddresses:](v5, "setCountNgramMatchInAuthorEmailAddresses:", [v4 countNgramMatchInAuthorEmailAddresses]);
    }
    if ([v4 countUnigramPrefixMatchInAuthorEmailAddresses]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountUnigramPrefixMatchInAuthorEmailAddresses:", [v4 countUnigramPrefixMatchInAuthorEmailAddresses]);
    }
    if ([v4 countBigramPrefixMatchInAuthorEmailAddresses]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountBigramPrefixMatchInAuthorEmailAddresses:", [v4 countBigramPrefixMatchInAuthorEmailAddresses]);
    }
    if ([v4 countNgramPrefixMatchInAuthorEmailAddresses]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInAuthorEmailAddresses:](v5, "setCountNgramPrefixMatchInAuthorEmailAddresses:", [v4 countNgramPrefixMatchInAuthorEmailAddresses]);
    }
    if ([v4 countUnigramMatchInSubject]) {
      -[SFMailRankingSignals setCountUnigramMatchInSubject:](v5, "setCountUnigramMatchInSubject:", [v4 countUnigramMatchInSubject]);
    }
    if ([v4 countBigramMatchInSubject]) {
      -[SFMailRankingSignals setCountBigramMatchInSubject:](v5, "setCountBigramMatchInSubject:", [v4 countBigramMatchInSubject]);
    }
    if ([v4 countNgramMatchInSubject]) {
      -[SFMailRankingSignals setCountNgramMatchInSubject:](v5, "setCountNgramMatchInSubject:", [v4 countNgramMatchInSubject]);
    }
    if ([v4 countUnigramPrefixMatchInSubject]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInSubject:](v5, "setCountUnigramPrefixMatchInSubject:", [v4 countUnigramPrefixMatchInSubject]);
    }
    if ([v4 countBigramPrefixMatchInSubject]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInSubject:](v5, "setCountBigramPrefixMatchInSubject:", [v4 countBigramPrefixMatchInSubject]);
    }
    if ([v4 countNgramPrefixMatchInSubject]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInSubject:](v5, "setCountNgramPrefixMatchInSubject:", [v4 countNgramPrefixMatchInSubject]);
    }
    if ([v4 countUnigramMatchInTextContent]) {
      -[SFMailRankingSignals setCountUnigramMatchInTextContent:](v5, "setCountUnigramMatchInTextContent:", [v4 countUnigramMatchInTextContent]);
    }
    if ([v4 countBigramMatchInTextContent]) {
      -[SFMailRankingSignals setCountBigramMatchInTextContent:](v5, "setCountBigramMatchInTextContent:", [v4 countBigramMatchInTextContent]);
    }
    if ([v4 countNgramMatchInTextContent]) {
      -[SFMailRankingSignals setCountNgramMatchInTextContent:](v5, "setCountNgramMatchInTextContent:", [v4 countNgramMatchInTextContent]);
    }
    if ([v4 countUnigramPrefixMatchInTextContent]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInTextContent:](v5, "setCountUnigramPrefixMatchInTextContent:", [v4 countUnigramPrefixMatchInTextContent]);
    }
    if ([v4 countBigramPrefixMatchInTextContent]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInTextContent:](v5, "setCountBigramPrefixMatchInTextContent:", [v4 countBigramPrefixMatchInTextContent]);
    }
    if ([v4 countNgramPrefixMatchInTextContent]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInTextContent:](v5, "setCountNgramPrefixMatchInTextContent:", [v4 countNgramPrefixMatchInTextContent]);
    }
    if ([v4 countUnigramMatchInRecipients]) {
      -[SFMailRankingSignals setCountUnigramMatchInRecipients:](v5, "setCountUnigramMatchInRecipients:", [v4 countUnigramMatchInRecipients]);
    }
    if ([v4 countBigramMatchInRecipients]) {
      -[SFMailRankingSignals setCountBigramMatchInRecipients:](v5, "setCountBigramMatchInRecipients:", [v4 countBigramMatchInRecipients]);
    }
    if ([v4 countNgramMatchInRecipients]) {
      -[SFMailRankingSignals setCountNgramMatchInRecipients:](v5, "setCountNgramMatchInRecipients:", [v4 countNgramMatchInRecipients]);
    }
    if ([v4 countUnigramPrefixMatchInRecipients]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInRecipients:](v5, "setCountUnigramPrefixMatchInRecipients:", [v4 countUnigramPrefixMatchInRecipients]);
    }
    if ([v4 countBigramPrefixMatchInRecipients]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInRecipients:](v5, "setCountBigramPrefixMatchInRecipients:", [v4 countBigramPrefixMatchInRecipients]);
    }
    if ([v4 countNgramPrefixMatchInRecipients]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInRecipients:](v5, "setCountNgramPrefixMatchInRecipients:", [v4 countNgramPrefixMatchInRecipients]);
    }
    if ([v4 countUnigramMatchInRecipientEmailAddresses]) {
      -[SFMailRankingSignals setCountUnigramMatchInRecipientEmailAddresses:](v5, "setCountUnigramMatchInRecipientEmailAddresses:", [v4 countUnigramMatchInRecipientEmailAddresses]);
    }
    if ([v4 countBigramMatchInRecipientEmailAddresses]) {
      -[SFMailRankingSignals setCountBigramMatchInRecipientEmailAddresses:](v5, "setCountBigramMatchInRecipientEmailAddresses:", [v4 countBigramMatchInRecipientEmailAddresses]);
    }
    if ([v4 countNgramMatchInRecipientEmailAddresses]) {
      -[SFMailRankingSignals setCountNgramMatchInRecipientEmailAddresses:](v5, "setCountNgramMatchInRecipientEmailAddresses:", [v4 countNgramMatchInRecipientEmailAddresses]);
    }
    if ([v4 countUnigramPrefixMatchInRecipientEmailAddresses]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountUnigramPrefixMatchInRecipientEmailAddresses:", [v4 countUnigramPrefixMatchInRecipientEmailAddresses]);
    }
    if ([v4 countBigramPrefixMatchInRecipientEmailAddresses]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountBigramPrefixMatchInRecipientEmailAddresses:", [v4 countBigramPrefixMatchInRecipientEmailAddresses]);
    }
    if ([v4 countNgramPrefixMatchInRecipientEmailAddresses]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInRecipientEmailAddresses:](v5, "setCountNgramPrefixMatchInRecipientEmailAddresses:", [v4 countNgramPrefixMatchInRecipientEmailAddresses]);
    }
    if ([v4 countUnigramMatchInEmailAddresses]) {
      -[SFMailRankingSignals setCountUnigramMatchInEmailAddresses:](v5, "setCountUnigramMatchInEmailAddresses:", [v4 countUnigramMatchInEmailAddresses]);
    }
    if ([v4 countBigramMatchInEmailAddresses]) {
      -[SFMailRankingSignals setCountBigramMatchInEmailAddresses:](v5, "setCountBigramMatchInEmailAddresses:", [v4 countBigramMatchInEmailAddresses]);
    }
    if ([v4 countNgramMatchInEmailAddresses]) {
      -[SFMailRankingSignals setCountNgramMatchInEmailAddresses:](v5, "setCountNgramMatchInEmailAddresses:", [v4 countNgramMatchInEmailAddresses]);
    }
    if ([v4 countUnigramPrefixMatchInEmailAddresses]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInEmailAddresses:](v5, "setCountUnigramPrefixMatchInEmailAddresses:", [v4 countUnigramPrefixMatchInEmailAddresses]);
    }
    if ([v4 countBigramPrefixMatchInEmailAddresses]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInEmailAddresses:](v5, "setCountBigramPrefixMatchInEmailAddresses:", [v4 countBigramPrefixMatchInEmailAddresses]);
    }
    if ([v4 countNgramPrefixMatchInEmailAddresses]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInEmailAddresses:](v5, "setCountNgramPrefixMatchInEmailAddresses:", [v4 countNgramPrefixMatchInEmailAddresses]);
    }
    if ([v4 countUnigramMatchInAttachmentTypes]) {
      -[SFMailRankingSignals setCountUnigramMatchInAttachmentTypes:](v5, "setCountUnigramMatchInAttachmentTypes:", [v4 countUnigramMatchInAttachmentTypes]);
    }
    if ([v4 countBigramMatchInAttachmentTypes]) {
      -[SFMailRankingSignals setCountBigramMatchInAttachmentTypes:](v5, "setCountBigramMatchInAttachmentTypes:", [v4 countBigramMatchInAttachmentTypes]);
    }
    if ([v4 countNgramMatchInAttachmentTypes]) {
      -[SFMailRankingSignals setCountNgramMatchInAttachmentTypes:](v5, "setCountNgramMatchInAttachmentTypes:", [v4 countNgramMatchInAttachmentTypes]);
    }
    if ([v4 countUnigramPrefixMatchInAttachmentTypes]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInAttachmentTypes:](v5, "setCountUnigramPrefixMatchInAttachmentTypes:", [v4 countUnigramPrefixMatchInAttachmentTypes]);
    }
    if ([v4 countBigramPrefixMatchInAttachmentTypes]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInAttachmentTypes:](v5, "setCountBigramPrefixMatchInAttachmentTypes:", [v4 countBigramPrefixMatchInAttachmentTypes]);
    }
    if ([v4 countNgramPrefixMatchInAttachmentTypes]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInAttachmentTypes:](v5, "setCountNgramPrefixMatchInAttachmentTypes:", [v4 countNgramPrefixMatchInAttachmentTypes]);
    }
    if ([v4 countUnigramMatchInAttachmentNames]) {
      -[SFMailRankingSignals setCountUnigramMatchInAttachmentNames:](v5, "setCountUnigramMatchInAttachmentNames:", [v4 countUnigramMatchInAttachmentNames]);
    }
    if ([v4 countBigramMatchInAttachmentNames]) {
      -[SFMailRankingSignals setCountBigramMatchInAttachmentNames:](v5, "setCountBigramMatchInAttachmentNames:", [v4 countBigramMatchInAttachmentNames]);
    }
    if ([v4 countNgramMatchInAttachmentNames]) {
      -[SFMailRankingSignals setCountNgramMatchInAttachmentNames:](v5, "setCountNgramMatchInAttachmentNames:", [v4 countNgramMatchInAttachmentNames]);
    }
    if ([v4 countUnigramPrefixMatchInAttachmentNames]) {
      -[SFMailRankingSignals setCountUnigramPrefixMatchInAttachmentNames:](v5, "setCountUnigramPrefixMatchInAttachmentNames:", [v4 countUnigramPrefixMatchInAttachmentNames]);
    }
    if ([v4 countBigramPrefixMatchInAttachmentNames]) {
      -[SFMailRankingSignals setCountBigramPrefixMatchInAttachmentNames:](v5, "setCountBigramPrefixMatchInAttachmentNames:", [v4 countBigramPrefixMatchInAttachmentNames]);
    }
    if ([v4 countNgramPrefixMatchInAttachmentNames]) {
      -[SFMailRankingSignals setCountNgramPrefixMatchInAttachmentNames:](v5, "setCountNgramPrefixMatchInAttachmentNames:", [v4 countNgramPrefixMatchInAttachmentNames]);
    }
    v22 = v5;
  }

  return v5;
}

@end