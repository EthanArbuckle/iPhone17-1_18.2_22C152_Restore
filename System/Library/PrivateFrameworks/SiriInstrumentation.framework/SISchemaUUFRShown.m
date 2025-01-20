@interface SISchemaUUFRShown
- (BOOL)hasAceViewClass;
- (BOOL)hasAceViewID;
- (BOOL)hasDialogIdentifier;
- (BOOL)hasGridCardSection;
- (BOOL)hasLinkId;
- (BOOL)hasResponseCategory;
- (BOOL)hasSiriResponseContext;
- (BOOL)hasSiriUILocation;
- (BOOL)hasSnippetClass;
- (BOOL)hasSubRequestId;
- (BOOL)hasViewID;
- (BOOL)hasViewRegionDesignation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)aceViewClass;
- (NSString)aceViewID;
- (NSString)dialogIdentifier;
- (NSString)snippetClass;
- (NSString)viewID;
- (SISchemaGridCardSection)gridCardSection;
- (SISchemaSiriResponseContext)siriResponseContext;
- (SISchemaUUFRShown)initWithDictionary:(id)a3;
- (SISchemaUUFRShown)initWithJSON:(id)a3;
- (SISchemaUUID)linkId;
- (SISchemaUUID)subRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)responseCategory;
- (int)siriUILocation;
- (int)viewRegionDesignation;
- (unint64_t)hash;
- (unint64_t)whichSubsection;
- (void)deleteAceViewClass;
- (void)deleteAceViewID;
- (void)deleteDialogIdentifier;
- (void)deleteGridCardSection;
- (void)deleteLinkId;
- (void)deleteResponseCategory;
- (void)deleteSiriResponseContext;
- (void)deleteSiriUILocation;
- (void)deleteSnippetClass;
- (void)deleteSubRequestId;
- (void)deleteViewID;
- (void)deleteViewRegionDesignation;
- (void)setAceViewClass:(id)a3;
- (void)setAceViewID:(id)a3;
- (void)setDialogIdentifier:(id)a3;
- (void)setGridCardSection:(id)a3;
- (void)setHasAceViewClass:(BOOL)a3;
- (void)setHasAceViewID:(BOOL)a3;
- (void)setHasDialogIdentifier:(BOOL)a3;
- (void)setHasGridCardSection:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasResponseCategory:(BOOL)a3;
- (void)setHasSiriResponseContext:(BOOL)a3;
- (void)setHasSiriUILocation:(BOOL)a3;
- (void)setHasSnippetClass:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasViewID:(BOOL)a3;
- (void)setHasViewRegionDesignation:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setResponseCategory:(int)a3;
- (void)setSiriResponseContext:(id)a3;
- (void)setSiriUILocation:(int)a3;
- (void)setSnippetClass:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)setViewID:(id)a3;
- (void)setViewRegionDesignation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUUFRShown

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SISchemaUUFRShown;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(SISchemaUUFRShown *)self deleteDialogIdentifier];
  }
  v6 = [(SISchemaUUFRShown *)self siriResponseContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaUUFRShown *)self deleteSiriResponseContext];
  }
  v9 = [(SISchemaUUFRShown *)self gridCardSection];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaUUFRShown *)self deleteGridCardSection];
  }
  v12 = [(SISchemaUUFRShown *)self linkId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaUUFRShown *)self deleteLinkId];
  }
  v15 = [(SISchemaUUFRShown *)self subRequestId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SISchemaUUFRShown *)self deleteSubRequestId];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_gridCardSection, 0);
  objc_storeStrong((id *)&self->_aceViewClass, 0);
  objc_storeStrong((id *)&self->_aceViewID, 0);
  objc_storeStrong((id *)&self->_siriResponseContext, 0);
  objc_storeStrong((id *)&self->_dialogIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetClass, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasAceViewClass = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasAceViewID = a3;
}

- (void)setHasGridCardSection:(BOOL)a3
{
  self->_hasSiriResponseContext = a3;
}

- (BOOL)hasGridCardSection
{
  return self->_hasSiriResponseContext;
}

- (void)setHasAceViewClass:(BOOL)a3
{
  self->_hasDialogIdentifier = a3;
}

- (void)setHasAceViewID:(BOOL)a3
{
  self->_hasSnippetClass = a3;
}

- (void)setHasSiriResponseContext:(BOOL)a3
{
  self->_hasViewID = a3;
}

- (void)setHasDialogIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSnippetClass:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasViewID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (int)responseCategory
{
  return self->_responseCategory;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (int)viewRegionDesignation
{
  return self->_viewRegionDesignation;
}

- (void)setAceViewClass:(id)a3
{
}

- (NSString)aceViewClass
{
  return self->_aceViewClass;
}

- (void)setAceViewID:(id)a3
{
}

- (NSString)aceViewID
{
  return self->_aceViewID;
}

- (void)setSiriResponseContext:(id)a3
{
}

- (SISchemaSiriResponseContext)siriResponseContext
{
  return self->_siriResponseContext;
}

- (void)setDialogIdentifier:(id)a3
{
}

- (NSString)dialogIdentifier
{
  return self->_dialogIdentifier;
}

- (int)siriUILocation
{
  return self->_siriUILocation;
}

- (void)setSnippetClass:(id)a3
{
}

- (NSString)snippetClass
{
  return self->_snippetClass;
}

- (void)setViewID:(id)a3
{
}

- (NSString)viewID
{
  return self->_viewID;
}

- (unint64_t)whichSubsection
{
  return self->_whichSubsection;
}

- (SISchemaUUFRShown)initWithDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SISchemaUUFRShown;
  v5 = [(SISchemaUUFRShown *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"viewID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaUUFRShown *)v5 setViewID:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"snippetClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaUUFRShown *)v5 setSnippetClass:v9];
    }
    v32 = v8;
    v10 = [v4 objectForKeyedSubscript:@"siriUILocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRShown setSiriUILocation:](v5, "setSiriUILocation:", [v10 intValue]);
    }
    v31 = v10;
    int v11 = [v4 objectForKeyedSubscript:@"dialogIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(SISchemaUUFRShown *)v5 setDialogIdentifier:v12];
    }
    uint64_t v13 = [v4 objectForKeyedSubscript:@"siriResponseContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[SISchemaSiriResponseContext alloc] initWithDictionary:v13];
      [(SISchemaUUFRShown *)v5 setSiriResponseContext:v14];
    }
    v29 = (void *)v13;
    v15 = [v4 objectForKeyedSubscript:@"aceViewID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(SISchemaUUFRShown *)v5 setAceViewID:v16];
    }
    int v17 = [v4 objectForKeyedSubscript:@"aceViewClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(SISchemaUUFRShown *)v5 setAceViewClass:v18];
    }
    objc_super v19 = [v4 objectForKeyedSubscript:@"viewRegionDesignation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRShown setViewRegionDesignation:](v5, "setViewRegionDesignation:", [v19 intValue]);
    }
    v30 = v11;
    v33 = v6;
    v20 = [v4 objectForKeyedSubscript:@"gridCardSection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[SISchemaGridCardSection alloc] initWithDictionary:v20];
      [(SISchemaUUFRShown *)v5 setGridCardSection:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [[SISchemaUUID alloc] initWithDictionary:v22];
      [(SISchemaUUFRShown *)v5 setLinkId:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"responseCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRShown setResponseCategory:](v5, "setResponseCategory:", [v24 intValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[SISchemaUUID alloc] initWithDictionary:v25];
      [(SISchemaUUFRShown *)v5 setSubRequestId:v26];
    }
    v27 = v5;
  }
  return v5;
}

- (SISchemaUUFRShown)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUUFRShown *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUUFRShown *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_aceViewClass)
  {
    id v4 = [(SISchemaUUFRShown *)self aceViewClass];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"aceViewClass"];
  }
  if (self->_aceViewID)
  {
    v6 = [(SISchemaUUFRShown *)self aceViewID];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"aceViewID"];
  }
  if (self->_dialogIdentifier)
  {
    int v8 = [(SISchemaUUFRShown *)self dialogIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"dialogIdentifier"];
  }
  if (self->_gridCardSection)
  {
    v10 = [(SISchemaUUFRShown *)self gridCardSection];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"gridCardSection"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"gridCardSection"];
    }
  }
  if (self->_linkId)
  {
    uint64_t v13 = [(SISchemaUUFRShown *)self linkId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"linkId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v16 = [(SISchemaUUFRShown *)self responseCategory] - 1;
    if (v16 > 0xC) {
      int v17 = @"RESPONSECATEGORY_UNKNOWN";
    }
    else {
      int v17 = off_1E5EB8CD8[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"responseCategory"];
  }
  if (self->_siriResponseContext)
  {
    v18 = [(SISchemaUUFRShown *)self siriResponseContext];
    objc_super v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"siriResponseContext"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"siriResponseContext"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v21 = [(SISchemaUUFRShown *)self siriUILocation] - 1;
    if (v21 > 2) {
      v22 = @"SIRIUILOCATION_UNKNOWN_SIRI_UI_LOCATION";
    }
    else {
      v22 = off_1E5EB8D40[v21];
    }
    [v3 setObject:v22 forKeyedSubscript:@"siriUILocation"];
  }
  if (self->_snippetClass)
  {
    v23 = [(SISchemaUUFRShown *)self snippetClass];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"snippetClass"];
  }
  if (self->_subRequestId)
  {
    v25 = [(SISchemaUUFRShown *)self subRequestId];
    v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"subRequestId"];
    }
  }
  if (self->_viewID)
  {
    v28 = [(SISchemaUUFRShown *)self viewID];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"viewID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v30 = [(SISchemaUUFRShown *)self viewRegionDesignation] - 1;
    if (v30 > 2) {
      v31 = @"VIEWREGIONDESIGNATION_UNKNOWN_VIEW_REGION";
    }
    else {
      v31 = off_1E5EB8D58[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"viewRegionDesignation"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v15 = [(NSString *)self->_viewID hash];
  NSUInteger v13 = [(NSString *)self->_snippetClass hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_siriUILocation;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_dialogIdentifier hash];
  unint64_t v5 = [(SISchemaSiriResponseContext *)self->_siriResponseContext hash];
  NSUInteger v6 = [(NSString *)self->_aceViewID hash];
  NSUInteger v7 = [(NSString *)self->_aceViewClass hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_viewRegionDesignation;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(SISchemaGridCardSection *)self->_gridCardSection hash];
  unint64_t v10 = [(SISchemaUUID *)self->_linkId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_responseCategory;
  }
  else {
    uint64_t v11 = 0;
  }
  return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(SISchemaUUID *)self->_subRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  unint64_t whichSubsection = self->_whichSubsection;
  if (whichSubsection != [v4 whichSubsection]) {
    goto LABEL_57;
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self viewID];
  NSUInteger v7 = [v4 viewID];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_56;
  }
  uint64_t v8 = [(SISchemaUUFRShown *)self viewID];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(SISchemaUUFRShown *)self viewID];
    uint64_t v11 = [v4 viewID];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self snippetClass];
  NSUInteger v7 = [v4 snippetClass];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_56;
  }
  uint64_t v13 = [(SISchemaUUFRShown *)self snippetClass];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    NSUInteger v15 = [(SISchemaUUFRShown *)self snippetClass];
    unsigned int v16 = [v4 snippetClass];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[104] & 1)) {
    goto LABEL_57;
  }
  if (*(unsigned char *)&self->_has)
  {
    int siriUILocation = self->_siriUILocation;
    if (siriUILocation != [v4 siriUILocation]) {
      goto LABEL_57;
    }
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self dialogIdentifier];
  NSUInteger v7 = [v4 dialogIdentifier];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_56;
  }
  uint64_t v19 = [(SISchemaUUFRShown *)self dialogIdentifier];
  if (v19)
  {
    v20 = (void *)v19;
    unsigned int v21 = [(SISchemaUUFRShown *)self dialogIdentifier];
    v22 = [v4 dialogIdentifier];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self siriResponseContext];
  NSUInteger v7 = [v4 siriResponseContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_56;
  }
  uint64_t v24 = [(SISchemaUUFRShown *)self siriResponseContext];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(SISchemaUUFRShown *)self siriResponseContext];
    v27 = [v4 siriResponseContext];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self aceViewID];
  NSUInteger v7 = [v4 aceViewID];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_56;
  }
  uint64_t v29 = [(SISchemaUUFRShown *)self aceViewID];
  if (v29)
  {
    unsigned int v30 = (void *)v29;
    v31 = [(SISchemaUUFRShown *)self aceViewID];
    v32 = [v4 aceViewID];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self aceViewClass];
  NSUInteger v7 = [v4 aceViewClass];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_56;
  }
  uint64_t v34 = [(SISchemaUUFRShown *)self aceViewClass];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(SISchemaUUFRShown *)self aceViewClass];
    v37 = [v4 aceViewClass];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  int v39 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v39 != ((v4[104] >> 1) & 1)) {
    goto LABEL_57;
  }
  if (v39)
  {
    int viewRegionDesignation = self->_viewRegionDesignation;
    if (viewRegionDesignation != [v4 viewRegionDesignation]) {
      goto LABEL_57;
    }
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self gridCardSection];
  NSUInteger v7 = [v4 gridCardSection];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_56;
  }
  uint64_t v41 = [(SISchemaUUFRShown *)self gridCardSection];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(SISchemaUUFRShown *)self gridCardSection];
    v44 = [v4 gridCardSection];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self linkId];
  NSUInteger v7 = [v4 linkId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_56;
  }
  uint64_t v46 = [(SISchemaUUFRShown *)self linkId];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(SISchemaUUFRShown *)self linkId];
    v49 = [v4 linkId];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  int v51 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v51 != ((v4[104] >> 2) & 1)) {
    goto LABEL_57;
  }
  if (v51)
  {
    int responseCategory = self->_responseCategory;
    if (responseCategory != [v4 responseCategory]) {
      goto LABEL_57;
    }
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self subRequestId];
  NSUInteger v7 = [v4 subRequestId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v53 = [(SISchemaUUFRShown *)self subRequestId];
    if (!v53)
    {

LABEL_60:
      BOOL v58 = 1;
      goto LABEL_58;
    }
    v54 = (void *)v53;
    v55 = [(SISchemaUUFRShown *)self subRequestId];
    v56 = [v4 subRequestId];
    char v57 = [v55 isEqual:v56];

    if (v57) {
      goto LABEL_60;
    }
  }
  else
  {
LABEL_56:
  }
LABEL_57:
  BOOL v58 = 0;
LABEL_58:

  return v58;
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  NSUInteger v4 = [(SISchemaUUFRShown *)self viewID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(SISchemaUUFRShown *)self snippetClass];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(SISchemaUUFRShown *)self dialogIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v7 = [(SISchemaUUFRShown *)self siriResponseContext];

  if (v7)
  {
    uint64_t v8 = [(SISchemaUUFRShown *)self siriResponseContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v9 = [(SISchemaUUFRShown *)self aceViewID];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  unint64_t v10 = [(SISchemaUUFRShown *)self aceViewClass];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v11 = [(SISchemaUUFRShown *)self gridCardSection];

  if (v11)
  {
    int v12 = [(SISchemaUUFRShown *)self gridCardSection];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v13 = [(SISchemaUUFRShown *)self linkId];

  if (v13)
  {
    uint64_t v14 = [(SISchemaUUFRShown *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v15 = [(SISchemaUUFRShown *)self subRequestId];

  unsigned int v16 = v18;
  if (v15)
  {
    int v17 = [(SISchemaUUFRShown *)self subRequestId];
    PBDataWriterWriteSubmessage();

    unsigned int v16 = v18;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRShownReadFrom(self, (uint64_t)a3);
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteResponseCategory
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasResponseCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResponseCategory
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setResponseCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int responseCategory = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteGridCardSection
{
  if (self->_whichSubsection == 9)
  {
    self->_unint64_t whichSubsection = 0;
    self->_gridCardSection = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaGridCardSection)gridCardSection
{
  if (self->_whichSubsection == 9) {
    v2 = self->_gridCardSection;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setGridCardSection:(id)a3
{
  unint64_t v3 = 9;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichSubsection = v3;
  objc_storeStrong((id *)&self->_gridCardSection, a3);
}

- (void)deleteViewRegionDesignation
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasViewRegionDesignation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasViewRegionDesignation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setViewRegionDesignation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int viewRegionDesignation = a3;
}

- (void)deleteAceViewClass
{
}

- (BOOL)hasAceViewClass
{
  return self->_aceViewClass != 0;
}

- (void)deleteAceViewID
{
}

- (BOOL)hasAceViewID
{
  return self->_aceViewID != 0;
}

- (void)deleteSiriResponseContext
{
}

- (BOOL)hasSiriResponseContext
{
  return self->_siriResponseContext != 0;
}

- (void)deleteDialogIdentifier
{
}

- (BOOL)hasDialogIdentifier
{
  return self->_dialogIdentifier != 0;
}

- (void)deleteSiriUILocation
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSiriUILocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSiriUILocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSiriUILocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int siriUILocation = a3;
}

- (void)deleteSnippetClass
{
}

- (BOOL)hasSnippetClass
{
  return self->_snippetClass != 0;
}

- (void)deleteViewID
{
}

- (BOOL)hasViewID
{
  return self->_viewID != 0;
}

@end