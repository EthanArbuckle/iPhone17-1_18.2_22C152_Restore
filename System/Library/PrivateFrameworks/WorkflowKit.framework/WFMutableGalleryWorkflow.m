@interface WFMutableGalleryWorkflow
- (CKRecordID)base;
- (CKRecordID)identifier;
- (NSArray)hiddenRegions;
- (NSArray)supportedIdioms;
- (NSDate)createdAt;
- (NSDate)modifiedAt;
- (NSNumber)searchable;
- (NSString)language;
- (NSString)longDescription;
- (NSString)name;
- (NSString)persistentIdentifier;
- (NSString)shortDescription;
- (WFFileRepresentation)iconFile;
- (WFFileRepresentation)shortcutFile;
- (WFWorkflowRecord)workflowRecord;
- (int64_t)minVersion;
- (void)setBase:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setHiddenRegions:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconFile:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLongDescription:(id)a3;
- (void)setMinVersion:(int64_t)a3;
- (void)setModifiedAt:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setSearchable:(id)a3;
- (void)setShortDescription:(id)a3;
- (void)setShortcutFile:(id)a3;
- (void)setSupportedIdioms:(id)a3;
- (void)setWorkflowRecord:(id)a3;
@end

@implementation WFMutableGalleryWorkflow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->iconFile, 0);
  objc_storeStrong((id *)&self->shortcutFile, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong((id *)&self->base, 0);
  objc_storeStrong((id *)&self->language, 0);
  objc_storeStrong((id *)&self->modifiedAt, 0);
  objc_storeStrong((id *)&self->createdAt, 0);
  objc_storeStrong((id *)&self->workflowRecord, 0);
  objc_storeStrong((id *)&self->supportedIdioms, 0);
  objc_storeStrong((id *)&self->hiddenRegions, 0);
  objc_storeStrong((id *)&self->searchable, 0);
  objc_storeStrong((id *)&self->longDescription, 0);
  objc_storeStrong((id *)&self->shortDescription, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)setIconFile:(id)a3
{
}

- (WFFileRepresentation)iconFile
{
  return self->iconFile;
}

- (void)setShortcutFile:(id)a3
{
}

- (WFFileRepresentation)shortcutFile
{
  return self->shortcutFile;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

- (void)setBase:(id)a3
{
}

- (CKRecordID)base
{
  return self->base;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->language;
}

- (void)setModifiedAt:(id)a3
{
}

- (NSDate)modifiedAt
{
  return self->modifiedAt;
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)createdAt
{
  return self->createdAt;
}

- (void)setWorkflowRecord:(id)a3
{
}

- (WFWorkflowRecord)workflowRecord
{
  return self->workflowRecord;
}

- (void)setSupportedIdioms:(id)a3
{
}

- (NSArray)supportedIdioms
{
  return self->supportedIdioms;
}

- (void)setHiddenRegions:(id)a3
{
}

- (NSArray)hiddenRegions
{
  return self->hiddenRegions;
}

- (void)setMinVersion:(int64_t)a3
{
  self->minVersion = a3;
}

- (int64_t)minVersion
{
  return self->minVersion;
}

- (void)setSearchable:(id)a3
{
}

- (NSNumber)searchable
{
  return self->searchable;
}

- (void)setLongDescription:(id)a3
{
}

- (NSString)longDescription
{
  return self->longDescription;
}

- (void)setShortDescription:(id)a3
{
}

- (NSString)shortDescription
{
  return self->shortDescription;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->name;
}

- (void)setIdentifier:(id)a3
{
}

- (CKRecordID)identifier
{
  return self->identifier;
}

- (void)setIcon:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "backgroundColorValue"));
  [(WFGalleryWorkflow *)self setIconColor:v6];

  v7 = NSNumber;
  uint64_t v8 = [v5 glyphCharacter];

  id v9 = [v7 numberWithUnsignedShort:v8];
  [(WFGalleryWorkflow *)self setIconGlyph:v9];
}

@end