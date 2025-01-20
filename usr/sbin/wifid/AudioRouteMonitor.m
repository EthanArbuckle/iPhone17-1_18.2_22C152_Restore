@interface AudioRouteMonitor
- (BOOL)monitoring;
- (__WiFiAudioRoute)audioRouteHandler;
- (void)audioRouteChange:(id)a3;
- (void)dealloc;
- (void)initializeWithHandler:(__WiFiAudioRoute *)a3;
- (void)setAudioRouteHandler:(__WiFiAudioRoute *)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation AudioRouteMonitor

- (void)initializeWithHandler:(__WiFiAudioRoute *)a3
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: starting", "-[AudioRouteMonitor initializeWithHandler:]")];
  }
  [(AudioRouteMonitor *)self setAudioRouteHandler:a3];

  [(AudioRouteMonitor *)self setMonitoring:0];
}

- (void)dealloc
{
  if ([(AudioRouteMonitor *)self monitoring]) {
    [(AudioRouteMonitor *)self stopMonitoring];
  }
  v3.receiver = self;
  v3.super_class = (Class)AudioRouteMonitor;
  [(AudioRouteMonitor *)&v3 dealloc];
}

- (void)audioRouteChange:(id)a3
{
  objc_super v3 = [(AudioRouteMonitor *)self audioRouteHandler];

  sub_100173F48((uint64_t)v3);
}

- (void)startMonitoring
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: adding observer", "-[AudioRouteMonitor startMonitoring]")];
  }
  [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") addObserver:self selector:"audioRouteChange:" name:AVAudioSessionRouteChangeNotification object:+[AVAudioSession sharedInstance]];

  [(AudioRouteMonitor *)self setMonitoring:1];
}

- (void)stopMonitoring
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: removing observer", "-[AudioRouteMonitor stopMonitoring]");
  }
  [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") removeObserver:self name:AVAudioSessionRouteChangeNotification object:+[AVAudioSession sharedInstance]];

  [(AudioRouteMonitor *)self setMonitoring:0];
}

- (__WiFiAudioRoute)audioRouteHandler
{
  return self->_audioRouteHandler;
}

- (void)setAudioRouteHandler:(__WiFiAudioRoute *)a3
{
  self->_audioRouteHandler = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

@end