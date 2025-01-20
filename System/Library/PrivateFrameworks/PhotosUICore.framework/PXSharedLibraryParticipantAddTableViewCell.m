@interface PXSharedLibraryParticipantAddTableViewCell
- (PXSharedLibraryParticipantAddButton)addButton;
- (PXSharedLibraryParticipantAddTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation PXSharedLibraryParticipantAddTableViewCell

- (void).cxx_destruct
{
}

- (PXSharedLibraryParticipantAddButton)addButton
{
  return self->_addButton;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryParticipantAddTableViewCell;
  [(PXSharedLibraryParticipantAddTableViewCell *)&v3 layoutSubviews];
  [(PXSharedLibraryParticipantAddTableViewCell *)self bounds];
  -[PXSharedLibraryParticipantAddButton setFrame:](self->_addButton, "setFrame:");
}

- (PXSharedLibraryParticipantAddTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryParticipantAddTableViewCell;
  v4 = [(PXSharedLibraryParticipantAddTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(PXSharedLibraryParticipantAddButton);
    addButton = v4->_addButton;
    v4->_addButton = v5;

    +[PXSharedLibraryParticipantTableCellModel imageDiameter];
    -[PXSharedLibraryParticipantAddButton setImageSizeToAlignWith:](v4->_addButton, "setImageSizeToAlignWith:", v7, v7);
    +[PXSharedLibraryParticipantTableCellModel imageInset];
    -[PXSharedLibraryParticipantAddButton setInset:](v4->_addButton, "setInset:");
    [(PXSharedLibraryParticipantAddTableViewCell *)v4 addSubview:v4->_addButton];
  }
  return v4;
}

@end