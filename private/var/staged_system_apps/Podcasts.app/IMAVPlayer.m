@interface IMAVPlayer
- (unint64_t)currentChapterIndexSwift;
- (void)setCurrentChapterIndexSwift:(unint64_t)a3;
@end

@implementation IMAVPlayer

- (unint64_t)currentChapterIndexSwift
{
  return (unint64_t)[(IMAVPlayer *)self currentChapterIndex];
}

- (void)setCurrentChapterIndexSwift:(unint64_t)a3
{
}

@end