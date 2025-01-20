@interface FREditorialItemEntry
- (BOOL)showBadge;
- (FREditorialItemEntry)initWithEditorialItemID:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColorString:(id)a6 image:(id)a7 actionUrlString:(id)a8 lastModifiedDate:(id)a9 documentVersion:(id)a10 lastSeenDocumentVersion:(id)a11 showBadge:(BOOL)a12;
- (FREditorialItemEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4;
- (FREditorialItemEntry)initWithEntryID:(id)a3 editorialItemID:(id)a4 title:(id)a5 subtitle:(id)a6 subtitleColorString:(id)a7 image:(id)a8 actionUrlString:(id)a9 lastModifiedDate:(id)a10 documentVersion:(id)a11 lastSeenDocumentVersion:(id)a12 showBadge:(BOOL)a13;
- (NSData)image;
- (NSDate)lastModifiedDate;
- (NSString)actionUrlString;
- (NSString)documentVersion;
- (NSString)editorialItemID;
- (NSString)entryID;
- (NSString)lastSeenDocumentVersion;
- (NSString)subtitle;
- (NSString)subtitleColorString;
- (NSString)title;
- (id)_editorialEntryIDForIdentifier:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation FREditorialItemEntry

- (FREditorialItemEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v22 = v5;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007944C();
  }
  v7 = [v6 objectForKeyedSubscript:@"FREditorialItemEntryEditorialItemID"];
  v8 = [v6 objectForKeyedSubscript:@"FREditorialItemEntryTitle"];
  v9 = [v6 objectForKeyedSubscript:@"FREditorialItemEntrySubtitle"];
  v19 = [v6 objectForKeyedSubscript:@"FREditorialItemEntrySubtitleColor"];
  v18 = [v6 objectForKeyedSubscript:@"FREditorialItemEntryImage"];
  v10 = [v6 objectForKeyedSubscript:@"FREditorialItemEntryActionURL"];
  v11 = [v6 objectForKeyedSubscript:@"FREditorialItemEntryLastModifiedDate"];
  v12 = [v6 objectForKeyedSubscript:@"FREditorialItemEntryDocumentVersion"];
  v13 = [v6 objectForKeyedSubscript:@"FREditorialItemEntryLastSeenDocumentVersion"];
  v14 = [v6 objectForKeyedSubscript:@"FREditorialItemEntryLastShowBadge"];
  unsigned __int8 v15 = [v14 BOOLValue];

  LOBYTE(v17) = v15;
  v21 = [(FREditorialItemEntry *)self initWithEntryID:v22 editorialItemID:v7 title:v8 subtitle:v9 subtitleColorString:v19 image:v18 actionUrlString:v10 lastModifiedDate:v11 documentVersion:v12 lastSeenDocumentVersion:v13 showBadge:v17];

  return v21;
}

- (FREditorialItemEntry)initWithEntryID:(id)a3 editorialItemID:(id)a4 title:(id)a5 subtitle:(id)a6 subtitleColorString:(id)a7 image:(id)a8 actionUrlString:(id)a9 lastModifiedDate:(id)a10 documentVersion:(id)a11 lastSeenDocumentVersion:(id)a12 showBadge:(BOOL)a13
{
  id v18 = a3;
  id v51 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079394();
  }
  v52.receiver = self;
  v52.super_class = (Class)FREditorialItemEntry;
  v27 = [(FREditorialItemEntry *)&v52 init];
  v28 = v27;
  if (v18 && v27)
  {
    v29 = (NSString *)[v18 copy];
    entryID = v28->_entryID;
    v28->_entryID = v29;

    v31 = (NSString *)[v51 copy];
    editorialItemID = v28->_editorialItemID;
    v28->_editorialItemID = v31;

    v33 = (NSString *)[v19 copy];
    title = v28->_title;
    v28->_title = v33;

    v35 = (NSString *)[v20 copy];
    subtitle = v28->_subtitle;
    v28->_subtitle = v35;

    v37 = (NSString *)[v21 copy];
    subtitleColorString = v28->_subtitleColorString;
    v28->_subtitleColorString = v37;

    v39 = (NSString *)[v23 copy];
    actionUrlString = v28->_actionUrlString;
    v28->_actionUrlString = v39;

    v41 = (NSData *)[v22 copy];
    image = v28->_image;
    v28->_image = v41;

    v43 = (NSString *)[v25 copy];
    documentVersion = v28->_documentVersion;
    v28->_documentVersion = v43;

    v45 = (NSString *)[v26 copy];
    lastSeenDocumentVersion = v28->_lastSeenDocumentVersion;
    v28->_lastSeenDocumentVersion = v45;

    v47 = (NSDate *)[v24 copy];
    lastModifiedDate = v28->_lastModifiedDate;
    v28->_lastModifiedDate = v47;

    v28->_showBadge = a13;
  }

  return v28;
}

- (NSString)editorialItemID
{
  return self->_editorialItemID;
}

- (FREditorialItemEntry)initWithEditorialItemID:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColorString:(id)a6 image:(id)a7 actionUrlString:(id)a8 lastModifiedDate:(id)a9 documentVersion:(id)a10 lastSeenDocumentVersion:(id)a11 showBadge:(BOOL)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000792DC();
  }
  v50.receiver = self;
  v50.super_class = (Class)FREditorialItemEntry;
  v27 = [(FREditorialItemEntry *)&v50 init];
  v28 = v27;
  if (v18 && v27)
  {
    uint64_t v29 = [(FREditorialItemEntry *)v27 _editorialEntryIDForIdentifier:v18];
    entryID = v28->_entryID;
    v28->_entryID = (NSString *)v29;

    v31 = (NSString *)[v18 copy];
    editorialItemID = v28->_editorialItemID;
    v28->_editorialItemID = v31;

    v33 = (NSString *)[v19 copy];
    title = v28->_title;
    v28->_title = v33;

    v35 = (NSString *)[v20 copy];
    subtitle = v28->_subtitle;
    v28->_subtitle = v35;

    v37 = (NSString *)[v21 copy];
    subtitleColorString = v28->_subtitleColorString;
    v28->_subtitleColorString = v37;

    v39 = (NSString *)[v23 copy];
    actionUrlString = v28->_actionUrlString;
    v28->_actionUrlString = v39;

    v41 = (NSData *)[v22 copy];
    image = v28->_image;
    v28->_image = v41;

    v43 = (NSString *)[v25 copy];
    documentVersion = v28->_documentVersion;
    v28->_documentVersion = v43;

    v45 = (NSString *)[v26 copy];
    lastSeenDocumentVersion = v28->_lastSeenDocumentVersion;
    v28->_lastSeenDocumentVersion = v45;

    v47 = (NSDate *)[v24 copy];
    lastModifiedDate = v28->_lastModifiedDate;
    v28->_lastModifiedDate = v47;

    v28->_showBadge = a12;
  }

  return v28;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(FREditorialItemEntry *)self entryID];
  [v3 fc_safelySetObjectAllowingNil:v4 forKey:@"FREditorialItemEntryID"];

  id v5 = [(FREditorialItemEntry *)self editorialItemID];
  [v3 fc_safelySetObjectAllowingNil:v5 forKey:@"FREditorialItemEntryEditorialItemID"];

  id v6 = [(FREditorialItemEntry *)self title];
  [v3 fc_safelySetObjectAllowingNil:v6 forKey:@"FREditorialItemEntryTitle"];

  v7 = [(FREditorialItemEntry *)self subtitle];
  [v3 fc_safelySetObjectAllowingNil:v7 forKey:@"FREditorialItemEntrySubtitle"];

  v8 = [(FREditorialItemEntry *)self subtitleColorString];
  [v3 fc_safelySetObjectAllowingNil:v8 forKey:@"FREditorialItemEntrySubtitleColor"];

  v9 = [(FREditorialItemEntry *)self image];
  [v3 fc_safelySetObjectAllowingNil:v9 forKey:@"FREditorialItemEntryImage"];

  v10 = [(FREditorialItemEntry *)self actionUrlString];
  [v3 fc_safelySetObjectAllowingNil:v10 forKey:@"FREditorialItemEntryActionURL"];

  v11 = [(FREditorialItemEntry *)self lastModifiedDate];
  [v3 fc_safelySetObjectAllowingNil:v11 forKey:@"FREditorialItemEntryLastModifiedDate"];

  v12 = [(FREditorialItemEntry *)self documentVersion];
  [v3 fc_safelySetObjectAllowingNil:v12 forKey:@"FREditorialItemEntryDocumentVersion"];

  v13 = [(FREditorialItemEntry *)self lastSeenDocumentVersion];
  [v3 fc_safelySetObjectAllowingNil:v13 forKey:@"FREditorialItemEntryLastSeenDocumentVersion"];

  v14 = +[NSNumber numberWithBool:[(FREditorialItemEntry *)self showBadge]];
  [v3 fc_safelySetObjectAllowingNil:v14 forKey:@"FREditorialItemEntryLastShowBadge"];

  id v15 = [v3 copy];

  return v15;
}

- (id)_editorialEntryIDForIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@", @"ed-", a3];
}

- (NSString)entryID
{
  return self->_entryID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionUrlString
{
  return self->_actionUrlString;
}

- (NSString)subtitleColorString
{
  return self->_subtitleColorString;
}

- (NSString)documentVersion
{
  return self->_documentVersion;
}

- (NSString)lastSeenDocumentVersion
{
  return self->_lastSeenDocumentVersion;
}

- (NSData)image
{
  return self->_image;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (BOOL)showBadge
{
  return self->_showBadge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_lastSeenDocumentVersion, 0);
  objc_storeStrong((id *)&self->_documentVersion, 0);
  objc_storeStrong((id *)&self->_subtitleColorString, 0);
  objc_storeStrong((id *)&self->_actionUrlString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_editorialItemID, 0);

  objc_storeStrong((id *)&self->_entryID, 0);
}

@end