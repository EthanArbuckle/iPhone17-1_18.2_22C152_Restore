@interface ICNoteTimelineSection
- (ICNoteTimelineSection)initWithIdentifier:(id)a3 objectIDs:(id)a4;
- (ICNoteTimelineSectionIdentifier)identifier;
- (NSArray)objectIDs;
- (void)setIdentifier:(id)a3;
- (void)setObjectIDs:(id)a3;
@end

@implementation ICNoteTimelineSection

- (ICNoteTimelineSection)initWithIdentifier:(id)a3 objectIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteTimelineSection;
  v8 = [(ICNoteTimelineSection *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(ICNoteTimelineSection *)v8 setIdentifier:v6];
    v10 = (void *)[v7 copy];
    [(ICNoteTimelineSection *)v9 setObjectIDs:v10];
  }
  return v9;
}

- (void)setObjectIDs:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (ICNoteTimelineSectionIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end