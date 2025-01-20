@interface SIRINLUEXTERNALSystemDialogAct
- (BOOL)hasGaveOptions;
- (BOOL)hasIdA;
- (BOOL)hasInformed;
- (BOOL)hasOffered;
- (BOOL)hasPrompted;
- (BOOL)hasRenderedText;
- (BOOL)hasReportedFailure;
- (BOOL)hasReportedSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRICOMMONStringValue)renderedText;
- (SIRINLUEXTERNALSystemGaveOptions)gaveOptions;
- (SIRINLUEXTERNALSystemInformed)informed;
- (SIRINLUEXTERNALSystemOffered)offered;
- (SIRINLUEXTERNALSystemPrompted)prompted;
- (SIRINLUEXTERNALSystemReportedFailure)reportedFailure;
- (SIRINLUEXTERNALSystemReportedSuccess)reportedSuccess;
- (SIRINLUEXTERNALUUID)idA;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGaveOptions:(id)a3;
- (void)setIdA:(id)a3;
- (void)setInformed:(id)a3;
- (void)setOffered:(id)a3;
- (void)setPrompted:(id)a3;
- (void)setRenderedText:(id)a3;
- (void)setReportedFailure:(id)a3;
- (void)setReportedSuccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSystemDialogAct

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedSuccess, 0);
  objc_storeStrong((id *)&self->_reportedFailure, 0);
  objc_storeStrong((id *)&self->_renderedText, 0);
  objc_storeStrong((id *)&self->_prompted, 0);
  objc_storeStrong((id *)&self->_offered, 0);
  objc_storeStrong((id *)&self->_informed, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_gaveOptions, 0);
}

- (void)setRenderedText:(id)a3
{
}

- (SIRICOMMONStringValue)renderedText
{
  return self->_renderedText;
}

- (void)setReportedFailure:(id)a3
{
}

- (SIRINLUEXTERNALSystemReportedFailure)reportedFailure
{
  return self->_reportedFailure;
}

- (void)setReportedSuccess:(id)a3
{
}

- (SIRINLUEXTERNALSystemReportedSuccess)reportedSuccess
{
  return self->_reportedSuccess;
}

- (void)setInformed:(id)a3
{
}

- (SIRINLUEXTERNALSystemInformed)informed
{
  return self->_informed;
}

- (void)setGaveOptions:(id)a3
{
}

- (SIRINLUEXTERNALSystemGaveOptions)gaveOptions
{
  return self->_gaveOptions;
}

- (void)setOffered:(id)a3
{
}

- (SIRINLUEXTERNALSystemOffered)offered
{
  return self->_offered;
}

- (void)setPrompted:(id)a3
{
}

- (SIRINLUEXTERNALSystemPrompted)prompted
{
  return self->_prompted;
}

- (void)setIdA:(id)a3
{
}

- (SIRINLUEXTERNALUUID)idA
{
  return self->_idA;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  idA = self->_idA;
  v21 = v4;
  uint64_t v6 = v4[2];
  if (idA)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](idA, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALSystemDialogAct setIdA:](self, "setIdA:");
  }
  prompted = self->_prompted;
  uint64_t v8 = v21[5];
  if (prompted)
  {
    if (v8) {
      -[SIRINLUEXTERNALSystemPrompted mergeFrom:](prompted, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALSystemDialogAct setPrompted:](self, "setPrompted:");
  }
  offered = self->_offered;
  uint64_t v10 = v21[4];
  if (offered)
  {
    if (v10) {
      -[SIRINLUEXTERNALSystemOffered mergeFrom:](offered, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALSystemDialogAct setOffered:](self, "setOffered:");
  }
  gaveOptions = self->_gaveOptions;
  uint64_t v12 = v21[1];
  if (gaveOptions)
  {
    if (v12) {
      -[SIRINLUEXTERNALSystemGaveOptions mergeFrom:](gaveOptions, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SIRINLUEXTERNALSystemDialogAct setGaveOptions:](self, "setGaveOptions:");
  }
  informed = self->_informed;
  uint64_t v14 = v21[3];
  if (informed)
  {
    if (v14) {
      -[SIRINLUEXTERNALSystemInformed mergeFrom:](informed, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SIRINLUEXTERNALSystemDialogAct setInformed:](self, "setInformed:");
  }
  reportedSuccess = self->_reportedSuccess;
  uint64_t v16 = v21[8];
  if (reportedSuccess)
  {
    if (v16) {
      -[SIRINLUEXTERNALSystemReportedSuccess mergeFrom:](reportedSuccess, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[SIRINLUEXTERNALSystemDialogAct setReportedSuccess:](self, "setReportedSuccess:");
  }
  reportedFailure = self->_reportedFailure;
  uint64_t v18 = v21[7];
  if (reportedFailure)
  {
    if (v18) {
      -[SIRINLUEXTERNALSystemReportedFailure mergeFrom:](reportedFailure, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUEXTERNALSystemDialogAct setReportedFailure:](self, "setReportedFailure:");
  }
  renderedText = self->_renderedText;
  uint64_t v20 = v21[6];
  if (renderedText)
  {
    if (v20) {
      -[SIRICOMMONStringValue mergeFrom:](renderedText, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SIRINLUEXTERNALSystemDialogAct setRenderedText:](self, "setRenderedText:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_idA hash];
  unint64_t v4 = [(SIRINLUEXTERNALSystemPrompted *)self->_prompted hash] ^ v3;
  unint64_t v5 = [(SIRINLUEXTERNALSystemOffered *)self->_offered hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRINLUEXTERNALSystemGaveOptions *)self->_gaveOptions hash];
  unint64_t v7 = [(SIRINLUEXTERNALSystemInformed *)self->_informed hash];
  unint64_t v8 = v7 ^ [(SIRINLUEXTERNALSystemReportedSuccess *)self->_reportedSuccess hash];
  unint64_t v9 = v6 ^ v8 ^ [(SIRINLUEXTERNALSystemReportedFailure *)self->_reportedFailure hash];
  return v9 ^ [(SIRICOMMONStringValue *)self->_renderedText hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((idA = self->_idA, !((unint64_t)idA | v4[2])) || -[SIRINLUEXTERNALUUID isEqual:](idA, "isEqual:"))
    && ((prompted = self->_prompted, !((unint64_t)prompted | v4[5]))
     || -[SIRINLUEXTERNALSystemPrompted isEqual:](prompted, "isEqual:"))
    && ((offered = self->_offered, !((unint64_t)offered | v4[4]))
     || -[SIRINLUEXTERNALSystemOffered isEqual:](offered, "isEqual:"))
    && ((gaveOptions = self->_gaveOptions, !((unint64_t)gaveOptions | v4[1]))
     || -[SIRINLUEXTERNALSystemGaveOptions isEqual:](gaveOptions, "isEqual:"))
    && ((informed = self->_informed, !((unint64_t)informed | v4[3]))
     || -[SIRINLUEXTERNALSystemInformed isEqual:](informed, "isEqual:"))
    && ((reportedSuccess = self->_reportedSuccess, !((unint64_t)reportedSuccess | v4[8]))
     || -[SIRINLUEXTERNALSystemReportedSuccess isEqual:](reportedSuccess, "isEqual:"))
    && ((reportedFailure = self->_reportedFailure, !((unint64_t)reportedFailure | v4[7]))
     || -[SIRINLUEXTERNALSystemReportedFailure isEqual:](reportedFailure, "isEqual:")))
  {
    renderedText = self->_renderedText;
    if ((unint64_t)renderedText | v4[6]) {
      char v13 = -[SIRICOMMONStringValue isEqual:](renderedText, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_idA copyWithZone:a3];
  unint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SIRINLUEXTERNALSystemPrompted *)self->_prompted copyWithZone:a3];
  unint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(SIRINLUEXTERNALSystemOffered *)self->_offered copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(SIRINLUEXTERNALSystemGaveOptions *)self->_gaveOptions copyWithZone:a3];
  char v13 = (void *)v5[1];
  v5[1] = v12;

  id v14 = [(SIRINLUEXTERNALSystemInformed *)self->_informed copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  id v16 = [(SIRINLUEXTERNALSystemReportedSuccess *)self->_reportedSuccess copyWithZone:a3];
  v17 = (void *)v5[8];
  v5[8] = v16;

  id v18 = [(SIRINLUEXTERNALSystemReportedFailure *)self->_reportedFailure copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  id v20 = [(SIRICOMMONStringValue *)self->_renderedText copyWithZone:a3];
  v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_idA)
  {
    objc_msgSend(v4, "setIdA:");
    id v4 = v5;
  }
  if (self->_prompted)
  {
    objc_msgSend(v5, "setPrompted:");
    id v4 = v5;
  }
  if (self->_offered)
  {
    objc_msgSend(v5, "setOffered:");
    id v4 = v5;
  }
  if (self->_gaveOptions)
  {
    objc_msgSend(v5, "setGaveOptions:");
    id v4 = v5;
  }
  if (self->_informed)
  {
    objc_msgSend(v5, "setInformed:");
    id v4 = v5;
  }
  if (self->_reportedSuccess)
  {
    objc_msgSend(v5, "setReportedSuccess:");
    id v4 = v5;
  }
  if (self->_reportedFailure)
  {
    objc_msgSend(v5, "setReportedFailure:");
    id v4 = v5;
  }
  if (self->_renderedText)
  {
    objc_msgSend(v5, "setRenderedText:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_idA)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_prompted)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_offered)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_gaveOptions)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_informed)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_reportedSuccess)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_reportedFailure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_renderedText)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSystemDialogActReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  idA = self->_idA;
  if (idA)
  {
    id v5 = [(SIRINLUEXTERNALUUID *)idA dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"id_a"];
  }
  prompted = self->_prompted;
  if (prompted)
  {
    unint64_t v7 = [(SIRINLUEXTERNALSystemPrompted *)prompted dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"prompted"];
  }
  offered = self->_offered;
  if (offered)
  {
    unint64_t v9 = [(SIRINLUEXTERNALSystemOffered *)offered dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"offered"];
  }
  gaveOptions = self->_gaveOptions;
  if (gaveOptions)
  {
    v11 = [(SIRINLUEXTERNALSystemGaveOptions *)gaveOptions dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"gave_options"];
  }
  informed = self->_informed;
  if (informed)
  {
    char v13 = [(SIRINLUEXTERNALSystemInformed *)informed dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"informed"];
  }
  reportedSuccess = self->_reportedSuccess;
  if (reportedSuccess)
  {
    v15 = [(SIRINLUEXTERNALSystemReportedSuccess *)reportedSuccess dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"reported_success"];
  }
  reportedFailure = self->_reportedFailure;
  if (reportedFailure)
  {
    v17 = [(SIRINLUEXTERNALSystemReportedFailure *)reportedFailure dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"reported_failure"];
  }
  renderedText = self->_renderedText;
  if (renderedText)
  {
    v19 = [(SIRICOMMONStringValue *)renderedText dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"rendered_text"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSystemDialogAct;
  id v4 = [(SIRINLUEXTERNALSystemDialogAct *)&v8 description];
  id v5 = [(SIRINLUEXTERNALSystemDialogAct *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRenderedText
{
  return self->_renderedText != 0;
}

- (BOOL)hasReportedFailure
{
  return self->_reportedFailure != 0;
}

- (BOOL)hasReportedSuccess
{
  return self->_reportedSuccess != 0;
}

- (BOOL)hasInformed
{
  return self->_informed != 0;
}

- (BOOL)hasGaveOptions
{
  return self->_gaveOptions != 0;
}

- (BOOL)hasOffered
{
  return self->_offered != 0;
}

- (BOOL)hasPrompted
{
  return self->_prompted != 0;
}

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

@end