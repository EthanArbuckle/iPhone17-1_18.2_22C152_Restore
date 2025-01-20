@interface SearchUIWatchListCardRowModel
- (BOOL)hasError;
- (BOOL)hasLoaded;
- (BOOL)isDraggable;
- (NSString)subtitle;
- (NSString)title;
- (SFImage)image;
- (SFPunchout)punchout;
- (SearchUIWatchListCardRowModel)initWithResult:(id)a3 cardSection:(id)a4 asyncRowManager:(id)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7;
- (SearchUIWatchListCardRowModelDelegate)delegate;
- (SearchUIWatchListCardsManager)manager;
- (id)punchouts;
- (int)separatorStyle;
- (void)setDelegate:(id)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasLoaded:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setManager:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateWithTitle:(id)a3 subtitle:(id)a4;
- (void)updateWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 punchout:(id)a6;
@end

@implementation SearchUIWatchListCardRowModel

- (SearchUIWatchListCardRowModel)initWithResult:(id)a3 cardSection:(id)a4 asyncRowManager:(id)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIWatchListCardRowModel;
  v13 = [(SearchUICardSectionRowModel *)&v16 initWithResult:a3 cardSection:a4 isInline:0 queryId:a6 itemIdentifier:a7];
  v14 = v13;
  if (v13)
  {
    [(SearchUIWatchListCardRowModel *)v13 setManager:v12];
    [v12 addWatchListRowModelObserver:v14];
  }

  return v14;
}

- (void)updateWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SearchUIWatchListCardRowModel *)self setHasLoaded:1];
  [(SearchUIWatchListCardRowModel *)self setTitle:v7];

  [(SearchUIWatchListCardRowModel *)self setSubtitle:v6];
  id v8 = [(SearchUIWatchListCardRowModel *)self delegate];
  [v8 didUpdateRowModel:self animate:0];
}

- (void)updateWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 punchout:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(SearchUIWatchListCardRowModel *)self setHasLoaded:1];
  [(SearchUIWatchListCardRowModel *)self setTitle:v13];

  [(SearchUIWatchListCardRowModel *)self setSubtitle:v12];
  [(SearchUIWatchListCardRowModel *)self setImage:v11];

  [(SearchUIWatchListCardRowModel *)self setPunchout:v10];
  id v14 = [(SearchUIWatchListCardRowModel *)self delegate];
  [v14 didUpdateRowModel:self animate:1];
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
  [(SearchUIWatchListCardRowModel *)self setHasLoaded:1];
  id v4 = [(SearchUIWatchListCardRowModel *)self delegate];
  [v4 didUpdateRowModel:self animate:1];
}

- (id)punchouts
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SearchUIWatchListCardRowModel *)self punchout];
  if (v3)
  {
    id v4 = [(SearchUIWatchListCardRowModel *)self punchout];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isDraggable
{
  return 0;
}

- (int)separatorStyle
{
  if ([(SearchUIWatchListCardRowModel *)self hasError]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SearchUIWatchListCardRowModel;
  return [(SearchUICardSectionRowModel *)&v4 separatorStyle];
}

- (SearchUIWatchListCardRowModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIWatchListCardRowModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)setHasLoaded:(BOOL)a3
{
  self->_hasLoaded = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (SearchUIWatchListCardsManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end