@interface GEOSubPremise
- (NSString)localizedDescription;
@end

@implementation GEOSubPremise

- (NSString)localizedDescription
{
  switch([(GEOSubPremise *)self type])
  {
    case 0u:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"Unit %@";
      goto LABEL_6;
    case 1u:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"Floor %@";
      goto LABEL_6;
    case 2u:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"Postbox %@";
      goto LABEL_6;
    case 3u:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"Mailstop %@";
LABEL_6:
      v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];
      v8 = [(GEOSubPremise *)self name];
      v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

      break;
    default:
      break;
  }

  return (NSString *)v2;
}

@end