<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index($locale = '')
    {
        if ($locale === '') {
            session()->keepFlashdata('info');
            return redirect()->to($this->locale);
        }

        $this->request->setLocale($locale);

        session()->set('locale', $locale);
        
        helper('auth');
        
        return view ("Home\index");
    }

    public function testEmail()
    {
        $email = service('email');

        $email->setTo('josueadrianchacon@gmail.com');

        $email->setSubject('Test email');

        $email->setMessage('<h1>Puto pendejo</h1>');

        if ($email->send()) {
            echo "Email sent";
        } else {
            echo $email->printDebugger();
        }
    }
}
