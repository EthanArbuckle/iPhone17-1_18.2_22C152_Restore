@interface SCKPCardSectionViewProvider
- (BOOL)isShortcutCard:(id)a3;
- (CRCard)card;
- (NSArray)viewConfigurations;
- (NSString)providerIdentifier;
- (SCKPCardSectionViewProvider)initWithCard:(id)a3;
- (unint64_t)displayPriorityForCardSection:(id)a3;
@end

@implementation SCKPCardSectionViewProvider

- (SCKPCardSectionViewProvider)initWithCard:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKPCardSectionViewProvider;
  v6 = [(SCKPCardSectionViewProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_card, a3);
  }

  return v7;
}

- (NSArray)viewConfigurations
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v4 = [(CRCard *)self->_card cardSections];
  uint64_t v27 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v27)
  {
    uint64_t v5 = *(void *)v29;
    unint64_t v6 = 0x26484D000uLL;
    uint64_t v26 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        objc_super v9 = objc_msgSend(v8, "backingCardSection", v26);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        v11 = [v8 backingCardSection];
        if (isKindOfClass)
        {
          v12 = (SCKPMessageCardSectionViewController *)[objc_alloc(*(Class *)(v6 + 3240)) initWithMediaRemoteControlCardSection:v11];
          goto LABEL_8;
        }
        objc_opt_class();
        char v15 = objc_opt_isKindOfClass();

        if ((v15 & 1) == 0 || [(SCKPCardSectionViewProvider *)self isShortcutCard:self->_card]) {
          goto LABEL_12;
        }
        v11 = [v8 backingCardSection];
        if ([v11 messageStatus] != 1)
        {
          v16 = [v11 audioMessageURL];
          if (v16)
          {
          }
          else
          {
            v12 = [v11 messageAttachment];

            if (!v12) {
              goto LABEL_8;
            }
          }
        }
        v17 = [SCKPMessageCardSectionViewController alloc];
        [(CRCard *)self->_card interactions];
        v18 = self;
        v19 = v4;
        v21 = id v20 = v3;
        [v21 anyObject];
        v23 = unint64_t v22 = v6;
        v12 = [(SCKPMessageCardSectionViewController *)v17 initWithMessageCardSection:v11 interaction:v23];

        unint64_t v6 = v22;
        id v3 = v20;
        v4 = v19;
        self = v18;
        uint64_t v5 = v26;
LABEL_8:

        if (v12)
        {
          id v13 = objc_alloc_init(MEMORY[0x263F315F8]);
          [v13 setCardSection:v8];
          [v13 setCardSectionViewController:v12];
          v14 = [(SCKPMessageCardSectionViewController *)v12 view];
          [v13 setCardSectionView:v14];

          [v3 addObject:v13];
        }
LABEL_12:
        ++v7;
      }
      while (v27 != v7);
      uint64_t v24 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v27 = v24;
    }
    while (v24);
  }

  return (NSArray *)v3;
}

- (unint64_t)displayPriorityForCardSection:(id)a3
{
  return 2;
}

- (NSString)providerIdentifier
{
  return (NSString *)@"com.apple.cards.SiriUICardKitProvider";
}

- (BOOL)isShortcutCard:(id)a3
{
  id v3 = [a3 interactions];
  v4 = [v3 anyObject];

  uint64_t v5 = [v4 intent];
  unint64_t v6 = [v5 _metadata];
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    || [v6 executionContext] == 2
    || [v6 executionContext] == 9;

  return v7;
}

- (CRCard)card
{
  return self->_card;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConfigurations, 0);

  objc_storeStrong((id *)&self->_card, 0);
}

@end