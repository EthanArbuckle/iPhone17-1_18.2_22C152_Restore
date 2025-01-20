@interface WFAddToMediaLibraryContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (WFAddToMediaLibraryContextualAction)initWithCoder:(id)a3;
- (WFAddToMediaLibraryContextualAction)initWithMediaItemDescriptor:(id)a3;
- (WFContextualActionMediaItemDescriptor)mediaItemDescriptor;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAddToMediaLibraryContextualAction

- (void).cxx_destruct
{
}

- (WFContextualActionMediaItemDescriptor)mediaItemDescriptor
{
  return self->_mediaItemDescriptor;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAddToMediaLibraryContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_mediaItemDescriptor, @"mediaItemDescriptor", v5.receiver, v5.super_class);
}

- (WFAddToMediaLibraryContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFAddToMediaLibraryContextualAction;
  objc_super v5 = [(WFContextualAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaItemDescriptor"];
    if (v6)
    {
      objc_storeStrong((id *)&v5->_mediaItemDescriptor, v6);
      v7 = v5;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFAddToMediaLibraryContextualAction;
  if ([(WFContextualAction *)&v13 isEqual:v4])
  {
    id v5 = v4;
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = [v5 mediaItemDescriptor];
      v7 = [(WFAddToMediaLibraryContextualAction *)self mediaItemDescriptor];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        char v11 = 1;
      }
      else
      {
        char v11 = 0;
        if (v8 && v9) {
          char v11 = [v8 isEqual:v9];
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)WFAddToMediaLibraryContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v9, sel_hash));
  id v5 = [(WFAddToMediaLibraryContextualAction *)self mediaItemDescriptor];
  id v6 = (id)[v3 combine:v5];

  unint64_t v7 = [v3 finalize];
  return v7;
}

- (id)uniqueIdentifier
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(WFContextualAction *)self identifier];
  v10[0] = v3;
  id v4 = [(WFAddToMediaLibraryContextualAction *)self mediaItemDescriptor];
  id v5 = [v4 playbackStoreId];
  id v6 = [v5 stringValue];
  v10[1] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  id v8 = [v7 componentsJoinedByString:@"."];

  return v8;
}

- (WFAddToMediaLibraryContextualAction)initWithMediaItemDescriptor:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFAddToMediaLibraryContextualAction.m", 25, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];
  }
  unint64_t v7 = NSString;
  id v8 = WFLocalizedString(@"Add %@ to Library");
  objc_super v9 = [v6 name];
  v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

  char v11 = WFLocalizedString(@"Add to Library");
  v12 = [v6 name];
  objc_super v13 = +[WFContextualActionIcon iconWithSystemName:@"music.note.list"];
  v14 = [(WFContextualAction *)self initWithIdentifier:@"is.workflow.actions.addtoplaylist" wfActionIdentifier:@"is.workflow.actions.addtoplaylist" associatedAppBundleIdentifier:@"com.apple.Music" parameters:MEMORY[0x1E4F1CBF0] displayFormatString:v10 title:v11 subtitleFormatString:v12 icon:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_mediaItemDescriptor, a3);
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end