@interface WFPlayPodcastEpisodeContextualAction
+ (BOOL)supportsSecureCoding;
+ (WFContextualActionParameter)disambiguationParameter;
+ (WFTopHitItemContextualAction)disambiguationAction;
+ (id)availableCollectionIdentifiers;
+ (id)disambiguationSummaryStringForCollection:(id)a3;
+ (id)disambiguationSummaryStringWithParameterDefined:(BOOL)a3;
+ (void)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5;
- (INPlayMediaIntent)intent;
- (WFPlayPodcastEpisodeContextualAction)initWithCoder:(id)a3;
- (WFPlayPodcastEpisodeContextualAction)initWithIntent:(id)a3 artwork:(id)a4 namedQueryInfo:(id)a5;
- (id)displayString;
- (id)mediaItem;
- (id)uniqueIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIntent:(id)a3;
@end

@implementation WFPlayPodcastEpisodeContextualAction

- (void).cxx_destruct
{
}

- (void)setIntent:(id)a3
{
}

- (INPlayMediaIntent)intent
{
  return self->_intent;
}

- (WFPlayPodcastEpisodeContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPlayPodcastEpisodeContextualAction;
  v5 = [(WFContextualAction *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
    intent = v5->_intent;
    v5->_intent = (INPlayMediaIntent *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFPlayPodcastEpisodeContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v6 encodeWithCoder:v4];
  v5 = [(WFPlayPodcastEpisodeContextualAction *)self intent];
  [v4 encodeObject:v5 forKey:@"intent"];
}

- (WFPlayPodcastEpisodeContextualAction)initWithIntent:(id)a3 artwork:(id)a4 namedQueryInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10)
    {
LABEL_3:
      v12 = [[WFContextualActionIcon alloc] initWithImageData:v10 scale:0 displayStyle:2.0];
      goto LABEL_6;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFPlayPodcastEpisodeContextualAction.m", 45, @"Invalid parameter not satisfying: %@", @"intent" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v12 = 0;
LABEL_6:
  v14 = WFLocalizedString(@"Play %@");
  v15 = WFLocalizedString(@"Play Podcast");
  v16 = [v9 mediaContainer];
  v17 = [v16 title];
  v18 = v17;
  if (!v17)
  {
    v22 = [v9 mediaItems];
    v21 = [v22 firstObject];
    v18 = [v21 title];
  }
  v23.receiver = self;
  v23.super_class = (Class)WFPlayPodcastEpisodeContextualAction;
  v19 = [(WFTopHitItemContextualAction *)&v23 initWithItem:v9 identifier:@"is.workflow.actions.playpodcast" wfActionIdentifier:@"is.workflow.actions.playpodcast" associatedAppBundleIdentifier:@"com.apple.podcasts" parameters:MEMORY[0x1E4F1CBF0] displayFormatString:v14 title:v15 subtitleFormatString:v18 primaryColor:10 icon:v12 accessoryIcon:0 namedQueryInfo:v11];
  if (!v17)
  {
  }
  [(WFPlayPodcastEpisodeContextualAction *)v19 setIntent:v9];

  return v19;
}

- (id)displayString
{
  v3 = NSString;
  id v4 = WFLocalizedString(@"Play %@");
  v5 = [(WFPlayPodcastEpisodeContextualAction *)self intent];
  objc_super v6 = [v5 mediaContainer];
  uint64_t v7 = [v6 title];
  v8 = (void *)v7;
  if (v7)
  {
    id v9 = objc_msgSend(v3, "stringWithFormat:", v4, v7);
  }
  else
  {
    id v10 = [(WFPlayPodcastEpisodeContextualAction *)self intent];
    id v11 = [v10 mediaItems];
    v12 = [v11 firstObject];
    uint64_t v13 = [v12 title];
    v14 = (void *)v13;
    if (v13)
    {
      id v9 = objc_msgSend(v3, "stringWithFormat:", v4, v13);
    }
    else
    {
      v15 = WFLocalizedString(@"Podcast");
      id v9 = objc_msgSend(v3, "stringWithFormat:", v4, v15);
    }
  }

  return v9;
}

- (id)uniqueIdentifier
{
  v3 = [(WFContextualAction *)self identifier];
  id v4 = [(WFPlayPodcastEpisodeContextualAction *)self mediaItem];
  v5 = [v4 identifier];
  objc_super v6 = [v3 stringByAppendingFormat:@":%@", v5];

  return v6;
}

- (id)mediaItem
{
  v3 = [(WFPlayPodcastEpisodeContextualAction *)self intent];
  id v4 = [v3 mediaItems];
  v5 = [v4 firstObject];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(WFPlayPodcastEpisodeContextualAction *)self intent];
    id v7 = [v8 mediaContainer];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)disambiguationSummaryStringWithParameterDefined:(BOOL)a3
{
  if (a3)
  {
    v3 = @"Populated Play Specific Podcast (Title)";
    id v4 = @"Play ${WFPodcastShow}";
  }
  else
  {
    v3 = @"Unpopulated Play Specific Podcast (Title)";
    id v4 = @"Play Podcast…";
  }
  v5 = WFLocalizedStringWithKey(v3, v4);
  return v5;
}

+ (id)disambiguationSummaryStringForCollection:(id)a3
{
  if ([a3 isEqualToString:@"Suggested"])
  {
    v3 = WFLocalizedStringWithKey(@"Play Suggested Podcasts (Disambiguation Action Title)", @"Play Suggestions");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (void)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[VCVoiceShortcutClient standardClient];
  id v10 = (__CFString *)v7;
  id v11 = v10;
  if (v10 == @"Suggested"
    || v10
    && (char v12 = [(__CFString *)v10 isEqualToString:@"Suggested"],
        v11,
        (v12 & 1) != 0))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__WFPlayPodcastEpisodeContextualAction_disambiguationEntriesForCollection_limit_completionHandler___block_invoke;
    v14[3] = &unk_1E6079698;
    id v15 = v8;
    [v9 getUpcomingMediaForBundleIdentifier:@"com.apple.podcasts" limit:a4 completion:v14];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TopHitItemContextualActionError" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
  }
}

void __99__WFPlayPodcastEpisodeContextualAction_disambiguationEntriesForCollection_limit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_5821);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

WFPlayPodcastEpisodeContextualAction *__99__WFPlayPodcastEpisodeContextualAction_disambiguationEntriesForCollection_limit_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [WFAppShortcutNamedQueryInfo alloc];
  id v4 = WFLocalizedString(@"Up Next");
  v5 = [(WFAppShortcutNamedQueryInfo *)v3 initWithName:v4 symbolName:@"apple.podcasts"];

  objc_super v6 = [WFPlayPodcastEpisodeContextualAction alloc];
  id v7 = [v2 intent];
  id v8 = [v2 artwork];

  id v9 = [(WFPlayPodcastEpisodeContextualAction *)v6 initWithIntent:v7 artwork:v8 namedQueryInfo:v5];
  return v9;
}

+ (id)availableCollectionIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Suggested", 0);
}

+ (WFContextualActionParameter)disambiguationParameter
{
  id v2 = [[WFContextualActionParameter alloc] initWithType:@"WFPodcastEpisodeContentItem" displayString:&stru_1F0C7EBE0 wfParameterKey:@"WFPodcastShow" askEachTime:1];
  return v2;
}

+ (WFTopHitItemContextualAction)disambiguationAction
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [WFPlayPodcastEpisodeContextualAction alloc];
  id v4 = [a1 disambiguationParameter];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  objc_super v6 = WFLocalizedStringWithKey(@"Play Suggested Podcast (Display Format String)", @"Play %@");
  id v7 = WFLocalizedStringWithKey(@"Play Suggested Podcast (Title)", @"Play Suggested Podcast");
  id v8 = [[WFContextualActionIcon alloc] initWithSystemName:@"music.mic"];
  id v9 = [(WFTopHitItemContextualAction *)v3 initWithItem:0 identifier:@"is.workflow.actions.playpodcast" wfActionIdentifier:@"is.workflow.actions.playpodcast" associatedAppBundleIdentifier:@"com.apple.podcasts" parameters:v5 displayFormatString:v6 title:v7 subtitleFormatString:0 primaryColor:10 icon:v8 accessoryIcon:0 namedQueryInfo:0];

  return (WFTopHitItemContextualAction *)v9;
}

@end