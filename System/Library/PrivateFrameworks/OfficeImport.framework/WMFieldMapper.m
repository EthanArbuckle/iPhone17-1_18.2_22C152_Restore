@interface WMFieldMapper
- (WMFieldMapper)initWithWDFieldMarker:(id)a3 parent:(id)a4;
- (void)mapFieldMarkerAt:(id)a3 marker:(id)a4 withState:(id)a5;
- (void)mapRunAt:(id)a3 run:(id)a4 withState:(id)a5;
@end

@implementation WMFieldMapper

- (WMFieldMapper)initWithWDFieldMarker:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WMFieldMapper;
  v8 = [(CMMapper *)&v22 initWithParent:v7];
  v9 = v8;
  if (v8)
  {
    p_mParent = (id *)&v8->super.super.mParent;
    id WeakRetained = objc_loadWeakRetained((id *)&v8->super.super.mParent);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v13 = objc_loadWeakRetained(p_mParent);
      uint64_t v14 = [v13 activeNode];
      mActiveNode = v9->super.mActiveNode;
      v9->super.mActiveNode = (OIXMLElement *)v14;
    }
    else
    {
      id v13 = v9->super.mActiveNode;
      v9->super.mActiveNode = 0;
    }

    *((_DWORD *)&v9->super.mIsDeleted + 1) = 1;
    v9->mMode = [v6 fieldType];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v6;
      if ([v16 internalLink])
      {
        v17 = [v16 fragment];
        if (v17) {
          [v16 fragment];
        }
        else {
        v18 = [v16 link];
        }

        if (!v18) {
          goto LABEL_14;
        }
        uint64_t v19 = [[NSString alloc] initWithFormat:@"#%@", v18];
      }
      else
      {
        v18 = [v16 link];
        uint64_t v19 = [v18 copy];
      }
      mLink = v9->mLink;
      v9->mLink = (NSString *)v19;

LABEL_14:
    }
  }

  return v9;
}

- (void)mapFieldMarkerAt:(id)a3 marker:(id)a4 withState:(id)a5
{
  id v13 = a4;
  int v6 = [v13 fieldMarkerType];
  switch(v6)
  {
    case 21:
      if (self->mLink) {
        goto LABEL_10;
      }
      v9 = +[CMTextFilter filterHyperlinkField:self->mMarkerText];
      v10 = v9;
      if (v9 && (unint64_t)[v9 length] >= 3)
      {
        v11 = (NSString *)[v10 copy];
        mLink = self->mLink;
        self->mLink = v11;
      }
      if (self->mLink) {
LABEL_10:
      }
        -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x26EC19118, self->super.mActiveNode);
      break;
    case 20:
      *((_DWORD *)&self->super.mIsDeleted + 1) = 2;
      break;
    case 19:
      id v7 = +[OIXMLElement elementWithType:0];
      [(OIXMLElement *)self->super.mActiveNode addChild:v7];
      mActiveNode = self->super.mActiveNode;
      self->super.mActiveNode = v7;

      break;
  }
}

- (void)mapRunAt:(id)a3 run:(id)a4 withState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*((_DWORD *)&self->super.mIsDeleted + 1) != 2)
  {
    if (!self->mMarkerText)
    {
      v11 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
      mMarkerText = self->mMarkerText;
      self->mMarkerText = v11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = self->mMarkerText;
      uint64_t v14 = [v9 string];
      [(NSMutableString *)v13 appendString:v14];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      v15 = self->mMarkerText;
      uint64_t v14 = [v9 name];
      [(NSMutableString *)v15 appendString:v14];
    }

    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)WMFieldMapper;
  [(WMParagraphMapper *)&v16 mapRunAt:v8 run:v9 withState:v10];
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLink, 0);
  objc_storeStrong((id *)&self->mMarkerText, 0);
}

@end