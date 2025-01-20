@interface MTUpNextResultsController
+ (id)numberFormatter;
- (MTPlayerController)playerController;
- (MTUpNextResultsController)initWithPlayerController:(id)a3;
- (id)title;
- (unint64_t)startingIndexForDisplay;
- (void)setPlayerController:(id)a3;
@end

@implementation MTUpNextResultsController

- (MTUpNextResultsController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTUpNextResultsController;
  v5 = [(MTManifestResultsController *)&v8 initWithPlayerController:v4];
  if (v5)
  {
    v6 = [v4 upNextManifest];
    [(MTManifestResultsController *)v5 setManifest:v6];

    [(MTUpNextResultsController *)v5 setPlayerController:v4];
  }

  return v5;
}

- (id)title
{
  unint64_t v2 = [(MTResultsController *)self numberOfObjects];
  v3 = [(id)objc_opt_class() numberFormatter];
  id v4 = +[NSNumber numberWithUnsignedInteger:v2];
  v5 = [v3 stringFromNumber:v4];

  v6 = +[NSBundle mainBundle];
  v7 = v6;
  if (v2 == 1) {
    CFStringRef v8 = @"QUEUE_SONGS_SINGULAR";
  }
  else {
    CFStringRef v8 = @"QUEUE_SONGS_PLURAL";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_10056A8A0 table:0];
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v5);

  return v10;
}

+ (id)numberFormatter
{
  unint64_t v2 = (void *)qword_10060A908;
  if (!qword_10060A908)
  {
    id v3 = objc_alloc_init((Class)NSNumberFormatter);
    id v4 = (void *)qword_10060A908;
    qword_10060A908 = (uint64_t)v3;

    [(id)qword_10060A908 setNumberStyle:1];
    v5 = (void *)qword_10060A908;
    v6 = +[NSLocale currentLocale];
    [v5 setLocale:v6];

    [(id)qword_10060A908 setMaximumFractionDigits:0];
    unint64_t v2 = (void *)qword_10060A908;
  }

  return v2;
}

- (unint64_t)startingIndexForDisplay
{
  v8.receiver = self;
  v8.super_class = (Class)MTUpNextResultsController;
  id v3 = [(MTManifestResultsController *)&v8 startingIndexForDisplay];
  id v4 = [(MTUpNextResultsController *)self playerController];
  v5 = [v4 compositeManifest];

  v6 = [(MTManifestResultsController *)self manifest];
  LODWORD(v4) = [v5 isPlayingFromManifest:v6];

  return (unint64_t)v3 + v4;
}

- (MTPlayerController)playerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);

  return (MTPlayerController *)WeakRetained;
}

- (void)setPlayerController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end