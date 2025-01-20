@interface NoteAttachmentPresentationOccurence
- (DOMHTMLElement)element;
- (NoteAttachmentPresentation)presentation;
- (NoteAttachmentPresentationOccurence)init;
- (NoteAttachmentPresentationOccurence)initWithPresentation:(id)a3 element:(id)a4;
- (id)previewItemTitle;
- (id)previewItemURL;
@end

@implementation NoteAttachmentPresentationOccurence

- (NoteAttachmentPresentationOccurence)init
{
  return [(NoteAttachmentPresentationOccurence *)self initWithPresentation:0 element:0];
}

- (NoteAttachmentPresentationOccurence)initWithPresentation:(id)a3 element:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NoteAttachmentPresentationOccurence;
  v9 = [(NoteAttachmentPresentationOccurence *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentation, a3);
    objc_storeStrong((id *)&v10->_element, a4);
  }

  return v10;
}

- (id)previewItemURL
{
  v2 = [(NoteAttachmentPresentationOccurence *)self presentation];
  v3 = [v2 dataFileURL];

  return v3;
}

- (id)previewItemTitle
{
  v2 = [(NoteAttachmentPresentationOccurence *)self presentation];
  v3 = [v2 filename];
  v4 = [v3 lastPathComponent];

  return v4;
}

- (NoteAttachmentPresentation)presentation
{
  return self->_presentation;
}

- (DOMHTMLElement)element
{
  return self->_element;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
}

@end