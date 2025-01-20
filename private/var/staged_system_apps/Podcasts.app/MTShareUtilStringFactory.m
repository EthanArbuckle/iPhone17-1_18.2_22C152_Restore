@interface MTShareUtilStringFactory
+ (id)_bodyForShareEmailWithDataSource:(id)a3;
+ (id)_descriptionHTMLForDataSource:(id)a3;
+ (id)_footerHTMLForDataSource:(id)a3;
+ (id)_subtitleHTMLForDataSource:(id)a3;
+ (id)_titleHTMLForDataSource:(id)a3;
+ (id)bodyForShareEmailFromDataSource:(id)a3;
+ (id)subjectForShareEmailFromDataSource:(id)a3;
+ (id)textForShareToNotesFromDataSource:(id)a3;
@end

@implementation MTShareUtilStringFactory

+ (id)subjectForShareEmailFromDataSource:(id)a3
{
  id v3 = a3;
  if ([v3 currentShareMode] == (id)2)
  {
    v4 = [v3 sharePodcastTitle];
    v5 = [v3 shareEpisodeTitle];

    +[NSString stringWithFormat:@"%@: %@", v4, v5];
  }
  else
  {
    v6 = +[NSBundle mainBundle];
    v4 = [v6 localizedStringForKey:@"SHARE_EMAIL_SHOW_SUBJECT_FORMAT" value:&stru_10056A8A0 table:0];

    v5 = [v3 sharePodcastTitle];

    +[NSString stringWithValidatedFormat:v4, @"%@", 0, v5 validFormatSpecifiers error];
  v7 = };

  return v7;
}

+ (id)bodyForShareEmailFromDataSource:(id)a3
{
  return _[a1 _bodyForShareEmailWithDataSource:a3];
}

+ (id)textForShareToNotesFromDataSource:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"EPISODE_OR_PODCAST_SHARE_NOTES" value:&stru_10056A8A0 table:0];

  if ([v3 currentShareMode] == (id)1)
  {
    v6 = [v3 sharePodcastTitle];
    [v3 shareProvider];
  }
  else
  {
    v6 = [v3 shareEpisodeTitle];
    [v3 sharePodcastTitle];
  v7 = };
  if ([v7 length])
  {
    id v8 = +[NSString stringWithValidatedFormat:v5, @"%@ %@", 0, v6, v7 validFormatSpecifiers error];
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

+ (id)_titleHTMLForDataSource:(id)a3
{
  id v3 = a3;
  if ([v3 currentShareMode] == (id)1) {
    [v3 sharePodcastTitle];
  }
  else {
  v4 = [v3 shareEpisodeTitle];
  }

  if (v4)
  {
    v5 = +[NSString stringWithFormat:@"<strong>%@</strong>", v4];
  }
  else
  {
    v5 = &stru_10056A8A0;
  }

  return v5;
}

+ (id)_subtitleHTMLForDataSource:(id)a3
{
  id v3 = a3;
  if ([v3 currentShareMode] == (id)1) {
    [v3 shareProvider];
  }
  else {
  v4 = [v3 sharePodcastTitle];
  }

  if (v4)
  {
    v5 = +[NSString stringWithFormat:@"<br/>%@", v4];
  }
  else
  {
    v5 = &stru_10056A8A0;
  }

  return v5;
}

+ (id)_descriptionHTMLForDataSource:(id)a3
{
  id v3 = a3;
  v4 = [v3 shareDescription];
  if (v4)
  {
    v5 = [v3 shareDescription];
    v6 = +[NSString stringWithFormat:@"<br/><br/>%@", v5];
  }
  else
  {
    v6 = &stru_10056A8A0;
  }

  return v6;
}

+ (id)_footerHTMLForDataSource:(id)a3
{
  id v3 = [a3 shareURL];
  v4 = [v3 absoluteString];

  v5 = +[NSString stringWithFormat:@"<a href=\"%@\">%@</a>", v4, v4];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"SHARE_EMAIL_FOOTER_FORMAT" value:&stru_10056A8A0 table:0];

  id v8 = +[NSString stringWithFormat:@"<p>%@</p>", v7];
  v9 = +[NSString stringWithValidatedFormat:v8, @"%@", 0, v5 validFormatSpecifiers error];

  return v9;
}

+ (id)_bodyForShareEmailWithDataSource:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableString stringWithString:@"<html><body>"];
  v6 = [a1 _titleHTMLForDataSource:v4];
  [v5 appendString:v6];

  v7 = [a1 _subtitleHTMLForDataSource:v4];
  [v5 appendString:v7];

  id v8 = [a1 _descriptionHTMLForDataSource:v4];
  [v5 appendString:v8];

  v9 = [a1 _footerHTMLForDataSource:v4];

  [v5 appendString:v9];
  [v5 appendString:@"</body></html>"];

  return v5;
}

@end