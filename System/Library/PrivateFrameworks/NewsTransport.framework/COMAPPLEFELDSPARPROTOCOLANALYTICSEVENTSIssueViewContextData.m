@interface COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData
- (BOOL)hasIssueViewContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)issueViewContextAsString:(int)a3;
- (int)StringAsIssueViewContext:(id)a3;
- (int)issueViewContext;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIssueViewContext:(BOOL)a3;
- (void)setIssueViewContext:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData

- (int)issueViewContext
{
  if (*(unsigned char *)&self->_has) {
    return self->_issueViewContext;
  }
  else {
    return 0;
  }
}

- (void)setIssueViewContext:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_issueViewContext = a3;
}

- (void)setHasIssueViewContext:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIssueViewContext
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)issueViewContextAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26444ED98[a3];
  }

  return v3;
}

- (int)StringAsIssueViewContext:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VIEW_CONTEXT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISAGGREGATED_ARTICLE_VIEW_CONTEXT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ISSUE_VIEW_CONTEXT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData;
  int v4 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t issueViewContext = self->_issueViewContext;
    if (issueViewContext >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_issueViewContext);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444ED98[issueViewContext];
    }
    [v3 setObject:v5 forKey:@"issue_view_context"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_issueViewContext;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_issueViewContext;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_issueViewContext == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_issueViewContext;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t issueViewContext = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end