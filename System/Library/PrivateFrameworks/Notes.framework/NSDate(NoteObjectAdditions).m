@interface NSDate(NoteObjectAdditions)
+ (uint64_t)ic_modificationDateForNoteBeingEdited;
@end

@implementation NSDate(NoteObjectAdditions)

+ (uint64_t)ic_modificationDateForNoteBeingEdited
{
  return [MEMORY[0x1E4F1C9C8] date];
}

@end