@interface SUScriptReview
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSNumber)adamID;
- (NSNumber)rating;
- (NSString)body;
- (NSString)infoURL;
- (NSString)itemType;
- (NSString)nickname;
- (NSString)title;
- (SUScriptReview)init;
- (SUScriptReview)initWithReview:(id)a3;
- (id)_className;
- (id)copyReview;
- (id)hasSavedDraft;
- (id)nicknameIsConfirmed;
- (id)removeDraft;
- (id)restoreFromDraft;
- (id)saveAsDraft;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)setBody:(id)a3;
- (void)setInfoURL:(id)a3;
- (void)setNickname:(id)a3;
- (void)setRating:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUScriptReview

- (SUScriptReview)init
{
  return [(SUScriptReview *)self initWithReview:0];
}

- (SUScriptReview)initWithReview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUScriptReview;
  v4 = [(SUScriptObject *)&v8 init];
  if (v4)
  {
    if (a3)
    {
      v5 = (SUUIReviewMetadata *)[a3 copy];
    }
    else
    {
      uint64_t v6 = ISUIMobileStoreUIFramework();
      v5 = (SUUIReviewMetadata *)objc_alloc_init((Class)ISUIWeakLinkedClassForString(&cfstr_Suuireviewmeta.isa, v6));
    }
    v4->_review = v5;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptReview;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)copyReview
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (void *)[(SUUIReviewMetadata *)self->_review copy];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)removeDraft
{
  return (id)*MEMORY[0x263EFFB38];
}

- (id)restoreFromDraft
{
  return (id)*MEMORY[0x263EFFB38];
}

- (id)saveAsDraft
{
  return (id)*MEMORY[0x263EFFB38];
}

- (NSNumber)adamID
{
  return 0;
}

- (NSString)body
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (NSString *)(id)[(SUUIReviewMetadata *)self->_review body];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_className
{
  return @"iTunesReview";
}

- (id)hasSavedDraft
{
  return (id)*MEMORY[0x263EFFB38];
}

- (NSString)infoURL
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(NSURL *)self->_infoURL absoluteString];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)itemType
{
  return 0;
}

- (NSString)nickname
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (NSString *)(id)[(SUUIReviewMetadata *)self->_review nickname];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)nicknameIsConfirmed
{
  return (id)*MEMORY[0x263EFFB38];
}

- (NSNumber)rating
{
  [(SUScriptObject *)self lock];
  objc_super v3 = NSNumber;
  [(SUUIReviewMetadata *)self->_review rating];
  v4 = (NSNumber *)objc_msgSend(v3, "numberWithFloat:");
  [(SUScriptObject *)self unlock];
  return v4;
}

- (void)setBody:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    [(SUUIReviewMetadata *)self->_review setBody:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setInfoURL:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    char v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  char v6 = 1;
  if (!a3 || (isKindOfClass & 1) != 0)
  {
LABEL_7:
    [(SUScriptObject *)self lock];

    if (v6) {
      objc_super v8 = 0;
    }
    else {
      objc_super v8 = (NSURL *)[objc_alloc(NSURL) initWithString:v5];
    }
    self->_infoURL = v8;
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = 0;
    id v5 = a3;
    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

- (void)setNickname:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    [(SUUIReviewMetadata *)self->_review setNickname:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setRating:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(SUScriptObject *)self lock];
    review = self->_review;
    [a3 floatValue];
    -[SUUIReviewMetadata setRating:](review, "setRating:");
    [(SUScriptObject *)self unlock];
  }
  else
  {
    char v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

- (void)setTitle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    [(SUUIReviewMetadata *)self->_review setTitle:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (NSString)title
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (NSString *)(id)[(SUUIReviewMetadata *)self->_review title];
  [(SUScriptObject *)self unlock];
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_41, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptReview;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_33, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptReview;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptReview;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_41 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_33 = (uint64_t)sel_removeDraft;
    *(void *)algn_2681B5128 = @"removeDraft";
    qword_2681B5130 = (uint64_t)sel_restoreFromDraft;
    unk_2681B5138 = @"restoreFromDraft";
    qword_2681B5140 = (uint64_t)sel_saveAsDraft;
    unk_2681B5148 = @"saveAsDraft";
    __KeyMapping_41 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"adamID", @"body", @"body", @"hasSavedDraft", @"hasSavedDraft", @"infoURL", @"infoURL", @"itemType", @"itemType", @"nickname", @"nickname", @"nicknameIsConfirmed", @"nicknameIsConfirmed", @"rating", @"rating", @"title", @"title",
                        0);
  }
}

@end