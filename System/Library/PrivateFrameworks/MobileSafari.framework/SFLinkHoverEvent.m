@interface SFLinkHoverEvent
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedMessageString;
- (NSURL)url;
- (SFLinkHoverEvent)initWithHoveredLinkURL:(id)a3 forCurrentURL:(id)a4 modifierFlags:(int64_t)a5 frame:(id)a6 targetFrame:(id)a7;
- (id)_formattedMessage;
- (int64_t)modifierFlags;
- (unint64_t)hash;
@end

@implementation SFLinkHoverEvent

- (SFLinkHoverEvent)initWithHoveredLinkURL:(id)a3 forCurrentURL:(id)a4 modifierFlags:(int64_t)a5 frame:(id)a6 targetFrame:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SFLinkHoverEvent;
  v17 = [(SFLinkHoverEvent *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_url, a3);
    v18->_modifierFlags = a5;
    v18->_hasTargetFrame = v16 != 0;
    uint64_t v19 = [v15 frameID];
    v18->_targetFrameIsSameAsFrame = v19 == [v16 frameID];
    v20 = [v13 fragment];
    uint64_t v21 = [v20 length];
    if (v21) {
      LOBYTE(v21) = objc_msgSend(v13, "safari_isSameAsURLRemovingFragment:", v14);
    }
    v18->_hasFragmentOnSamePage = v21;

    v22 = v18;
  }

  return v18;
}

- (id)_formattedMessage
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v3 = [(NSURL *)self->_url safari_defaultStatusMessageString];
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
  }
  else
  {
    v5 = self->_url;
    v6 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v7 = (void *)[v6 mutableCopy];

    [v7 setLineSpacing:1.5];
    [v7 setBaseWritingDirection:0];
    [v7 setAlignment:0];
    v21[0] = *MEMORY[0x1E4FB0700];
    uint64_t v8 = v21[0];
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    v21[1] = *MEMORY[0x1E4FB0738];
    v22[0] = v9;
    v22[1] = v7;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

    uint64_t v19 = v8;
    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v20 = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    if ([(NSURL *)v5 safari_isURLTooLongToDisplay])
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v14 = [(NSURL *)v5 safari_userVisibleStringConsideringLongURLs];
      id v15 = (void *)[v13 initWithString:v14 attributes:v10];
    }
    else
    {
      id v15 = [(NSURL *)v5 safari_attributedStringWithSimplificationOptions:5 attributes:v10 attributesForDeemphasizedText:v12 attributesForHTTPSProtocol:0];
    }

    id v16 = _WBSLocalizedString();
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16];
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithFormat:options:locale:", v17, 0, 0, v15);
  }

  return v4;
}

- (NSAttributedString)attributedMessageString
{
  attributedMessage = self->_attributedMessage;
  if (!attributedMessage)
  {
    v4 = [(SFLinkHoverEvent *)self _formattedMessage];
    v5 = self->_attributedMessage;
    self->_attributedMessage = v4;

    attributedMessage = self->_attributedMessage;
  }

  return attributedMessage;
}

- (BOOL)isEmpty
{
  return self->_url == 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFLinkHoverEvent *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SFLinkHoverEvent *)v5 url];
      if (WBSIsEqual())
      {
        int64_t modifierFlags = self->_modifierFlags;
        BOOL v8 = modifierFlags == [(SFLinkHoverEvent *)v5 modifierFlags];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_modifierFlags ^ [(NSURL *)self->_url hash];
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_attributedMessage, 0);
}

@end